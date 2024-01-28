{ pkgs, ... }:

let
  rstudio-with-packages = pkgs.rstudioWrapper.override {
    packages = with pkgs.rPackages; [];
  };
in
{

  home.packages = with pkgs; [
    rstudio-with-packages
  ]; 

}
