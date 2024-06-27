{ pkgs, lib, stdenvNoCC }:

stdenvNoCC.mkDerivation rec {

  pname = "cantarell-patched";
  version = "1.0";

  buildPhase = ''
    mkdir -p $out/share/fonts/opentype
    for f in ${pkgs.cantarell-fonts}/share/fonts/opentype/*; do
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $f --complete --no-progressbars --outputdir $out/share/fonts/opentype
    done
  '';

  dontInstall = true;
  dontUnpack = true;
  dontFixup = true;

  meta = with lib; {
    homepage = "https://github.com/ryanoasis/nerd-fonts";
    description = "Cantarell font patched with Nerd Fonts icons";
    license = licenses.ofl;
    platforms = platforms.all;
  };

}
