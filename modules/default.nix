{ pkgs, lib, config, ... }: {

  imports = [
    ./desktop
    ./zsh.nix
  ];

  options = {

    username = lib.mkOption {
      default = "n3mo";
      type = lib.types.str;
      description = ''
        username of main user
      '';
    };

    hostname = lib.mkOption {
      type = lib.types.str;
      description = ''
        hostname of nixos machine
      '';
    };

    homeDir = lib.mkOption {
      default = "/home/${config.username}";
      type = lib.types.str;
      description = ''
        home directory of main user
      '';
    };

    configDir = lib.mkOption {
      default = "${config.homeDir}/nixos-config";
      type = lib.types.str;
      description = ''
        directory storing nixos config
      '';
    };

    timezone = lib.mkOption {
      default = "America/Indiana/Indianapolis";
      type = lib.types.str;
      description = ''
        timezone that sytem primarily resides in
      '';
    };

    sshServer.port = lib.mkOption {
      default = 22;
      type = lib.types.port;
      description = ''
        port on which to host ssh server
      '';
    };

    pinentryPackage = lib.mkOption {
      default = pkgs.pinentry-curses;
      type = lib.types.package;
      description = ''
        flavor of pinentry
      '';
    };

  };

  config = {

    # hostname
    networking.hostName = config.hostname;

    # time zone
    time.timeZone = config.timezone;

    # locale
    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
      };
    };

    # swap caps and escape everywhere
    services.xserver.xkb = {
      layout = "us";
      variant = "";
      options = "caps:swapescape";
    };
    console.useXkbConfig = true;

    # set up user
    users = {
      mutableUsers = false;
      users."${config.username}" = {
        isNormalUser = true;
        description = "${config.username}";
        hashedPassword = "$6$SbShs85kCNZRdQ4f$J5.gwBoKIO8GSW2vFETLbiAFHRvL/6ngCdQKDuwwB4HIJg.F569vtCkQUrKMf578l3kDHE1peUjAANVT.C5PW0";
        extraGroups = [ "wheel" ];
        openssh.authorizedKeys.keyFiles = [ ../key.pub ];
      };
    };

    # sshd
    services.openssh = {
      enable = true;
      ports = [ config.sshServer.port ];
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    # allow passwordless sudo
    security.sudo.extraRules = [
      {
        groups = [ "wheel" ];
        commands = [
          {
            command = "ALL";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];

    # tailscale
    networking.firewall = {
      checkReversePath = "loose";
      trustedInterfaces = [ "tailscale0" ];
      allowedUDPPorts = [ config.services.tailscale.port ];
    };
    services.tailscale.enable = true;

    # nh (for rebuilding config)
    programs.nh = {
      enable = true;
      flake = "${config.configDir}";
      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };
    };

    # disable documentation (maybe stop doing this?)
    documentation.doc.enable = false;

    # stylix image, needed to get deploy.rs to shut up
    #stylix.image = ../wallpaper.png;

    # import some home manager modules
    home-manager.users.${config.username} = {

      imports = [
        ./git.nix
        ./gpg.nix
      ];

      # generic home manager setup
      home = {
        username = config.username;
        homeDirectory = config.homeDir;
        stateVersion = config.system.stateVersion;
      };
      programs.home-manager.enable = true;

    };

  };

}
