{ config, osConfig, pkgs, firefox-gnome-theme, ... }: {

  home.file.".mozilla/firefox/${osConfig.username}/chrome/firefox-gnome-theme".source =
      firefox-gnome-theme;

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        CaptivePortal = false;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = true;
        DisableFirefoxStudies = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;
        FirefoxHome = {
          Search = false;
          Pocket = false;
          Snippets = false;
          TopSites = false;
          Highlights = false;
        };
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };
      };
    };
    betterfox = {
      enable = true;
      profiles."${osConfig.username}".enableAllSections = true;
    };
    profiles = {
      "${osConfig.username}" = {
        id = 0;
        name = "${osConfig.username}";
        search = {
          force = true;
          default = "Searx";
          engines = {
            "Searx" = {
              urls = [
                {
                  template = "https://searx.n3mohomelab.xyz/search?q={searchTerms}";
                }
              ];
              definedAliases = [ "@s" ];
            };
            "Youtube" = {
              urls = [
                {
                  template = "https://www.youtube.com/results?search_query={searchTerms}";
                }
              ];
              icon = "https://www.youtube.com/s/desktop/8e0f920c/img/favicon_32x32.png";
              definedAliases = [ "@yt" ];
            };
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "type"; value = "packages"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "Nix Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    { name = "type"; value = "options"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@no" ];
            };
            "NixOS Wiki" = {
              urls = [
                {
                  template = "https://nixos.wiki/index.php?search={searchTerms}";
                }
              ];
              icon = "https://nixos.wiki/favicon.png";
              definedAliases = [ "@nw" ];
            };
            "google".metaData.hidden = true;
            "ddg".metaData.hidden = true;
            "bing".metaData.hidden = true;
            "amazondotcom-us".metaData.hidden = true;
            "ebay".metaData.hidden = true;
            "wikipedia".metaData.hidden = true;
            "perplexity".metaData.hidden = true;
          };
        };
        settings = {
          "general.smoothScroll" = true;
          "browser.startup.homepage" = "homepage.n3mohomelab.xyz";
          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_ever_enabled" = true;
          "privacy.donottrackheader.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "privacy.partition.network_state.ocsp_cache" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.uidensity" = 0;
          "svg.context-properties.content.enabled" = true;
          "browser.theme.dark-private-windows" = false;
          "browser.urlbar.formatting.enabled" = false;
          "browser.toolbars.bookmarks.visibility" = "never";
          "layers.acceleration.force-enabled" = true;
          "gnomeTheme.tabsAsHeaderbar" = false;
          "gnomeTheme.hideSingleTab" = true;
          "gnomeTheme.hideUnifiedExtensions" = false;
        };
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          istilldontcareaboutcookies
          linkhints
          new-tab-override
          sponsorblock
          ublock-origin
          violentmonkey
          bitwarden
        ];
        userChrome = ''
          @import "firefox-gnome-theme/userChrome.css";
          * {
            font-family: Adwaita Sans !important;
          }
          #urlbar {
            font-weight: bold !important;
            font-size: 11pt !important;
          }
        '';
        userContent = ''
          @import "firefox-gnome-theme/userContent.css";
        '';
      };

      fallback = {
        id = 1;
        name = "fallback";
      };

    };

  };

}
