{ pkgs, lib, config, ... }: {

  # adds user to neded groups
  users.users."${config.username}".extraGroups = [ "audio" "video" ];

  # pipewire jack suuport
  services.pipewire = {
    jack.enable = true;
    wireplumber.enable = true;
  };

  # musnix
  musnix = {
    enable = true;
    kernel.realtime = true;
    rtirq.enable = true;
    rtcqs.enable = true;
    alsaSeq.enable = true;
  };

  # hardware specific to d35k70p
  powerManagement.cpuFreqGovernor =
      lib.mkIf (config.hostname == "d35k70p") "performance";
  services.pipewire.extraConfig.pipewire."92-low-latency".context.properties =
      lib.mkIf (config.hostname == "d35k70p") {
    default.clock.rate = 48000;
    default.clock.quantum = 32;
    default.clock.min-quantum = 32;
    default.clock.max-quantum = 32;
  };

  # home manager
  home-manager.users.${config.username} = {

    #home.packages = with pkgs.stable; let
    #  #jackWrap = drv: pkgs.symlinkJoin {
    #  #  name = "${drv.name}-jackwrapped";
    #  #  paths = [ drv ];
    #  #  buildInputs = [ pkgs.makeWrapper ];
    #  #  postBuild = ''
    #  #    ls "$out/bin"
    #  #    for b in "$out/bin/"*; do
    #  #      wrapProgram "$b" \
    #  #        --prefix LD_LIBRARY_PATH : "${pkgs.pipewire.jack}/lib"
    #  #    done
    #  #  '';
    #  #};
    #  wrappedRaysession = pkgs.stable.raysession.overrideAttrs (oldAttrs: {
    #    buildInputs = (oldAttrs.buildInputs or []) ++ [
    #      #pkgs.python313Packages.legacy-cgi
    #      #pkgs.python313Packages.pyqt5-sip
    #      pkgs.python313Packages.pyqt5
    #    ];
    #    propagatedBuildInputs = (oldAttrs.propagatedBuildInputs or []) ++ [
    #      pkgs.python313Packages.legacy-cgi
    #      pkgs.python313Packages.pyqt5-sip
    #      pkgs.python313Packages.pyqt5
    #    ];
    #    postFixup = (oldAttrs.postFixup or "") + ''
    #      for b in $out/bin/*; do
    #        wrapProgram "$b" \
    #          --prefix LD_LIBRARY_PATH : "${pkgs.pipewire.jack}/lib"
    #      done
    #    '';
    #  });
    #in [
    #  ardour x42-avldrums helvum helm qlcplus wrappedRaysession
    #] ++ [
    #  lsp-plugins
    #];

    home.packages = with pkgs.stable; [
      ardour x42-avldrums helvum helm qlcplus
      (pkgs.callPackage ./custom-raysession.nix {})
    ] ++ [
      lsp-plugins
    ];

    # add obs flatpak
    services.flatpak.packages = [
      "org.kde.kdenlive"
      "org.nickvision.tubeconverter"
      "com.saivert.pwvucontrol"
      "io.github.dimtpap.coppwr"
      # obs and plugins
      "com.obsproject.Studio"
      "com.obsproject.Studio.Plugin.AitumMultistream"
      "com.obsproject.Studio.Plugin.VerticalCanvas"
    ];
    
  };

}
