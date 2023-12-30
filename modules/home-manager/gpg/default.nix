{ ... }:

{

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    sshKeys = [
      "7EAB46835347B4F951790A55E7BC6E0CE03B6A23"
      "B670794B2AE2CD76555645219D6767A7188CA08F"
    ];
  };

}
