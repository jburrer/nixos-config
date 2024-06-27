{ ... }:

{

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        decorations = "None";
        padding = {
          x = 10;
          y = 10;
        };
      };
    };
  };

}
