{ pkgs, ... }:

let
  r-with-packages = pkgs.rstudioWrapper.override {
    packages = with pkgs.rPackages; [];
  };
in
{

  home.packages = with pkgs; [
    #rstudioWrapper
    #r-with-packages
    rstudio
  ]; 

}
