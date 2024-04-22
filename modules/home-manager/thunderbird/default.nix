{ config, osConfig, pkgs, ... }:

{

  programs.thunderbird = {
    enable = true;
    profiles."n3mo" = {
      isDefault = true;
    };
  };

}
