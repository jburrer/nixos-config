let
  username = "n3mo";
  homeDir = "/home/n3mo";
in
{

  username = "${username}";
  homeDir = "${homeDir}";

  docsDir = "${homeDir}/Documents";
  dotsDir = "${homeDir}/Documents/nixos-config";
  scriptsDir = "${homeDir}/Documents/nixos-config/scripts";
  picsDir = "${homeDir}/Pictures";
  scrotsDir = "${homeDir}/Pictures/Screenshots";
  vidsDir = "${homeDir}/Videos";
  miscDir = "${homeDir}/Downloads";
  templatesDir = "${homeDir}/Templates";

  professionalUsername = "jb-24";
  professionalEmail = "jburrer@purdue.edu";
  personalUsername = "${username}";
  personalEmail = "${username}@no.one";

}
