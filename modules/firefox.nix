{ config, osConfig, pkgs, firefox-gnome-theme, ... }: {

  home.file.".mozilla/firefox/${osConfig.username}/chrome/firefox-gnome-theme".source =
      firefox-gnome-theme;

  programs = {

    firefox = {
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
      betterfox.enable = true;
      profiles."${osConfig.username}" = {
        id = 0;
        name = "${osConfig.username}";
        betterfox = {
          enable = true;
          enableAllSections = true;
        };
        search = {
          force = true;
          default = "Searx";
          engines = {
            "Searx" = {
              urls = [
                {
                  template = "https://searx.local.n3mohomelab.xyz/search?q={searchTerms}";
                }
              ];
              definedAliases = [ "@s" ];
            };
            "DuckDuckGoCustom" = {
              urls = [
                {
                  template = "https://start.duckduckgo.com/?kav=1&kn=1&k1=-1&kaj=u&kay=b&kv=-1&kak=-1&kax=-1&kaq=-1&kap=-1&kao=-1&kau=-1&kae=t&kt=Cantarell&kw=n&km=m&ka=Cantarell&kpsb=-1&kj=1e1e1e&k7=242424&k9=26a269&kaa=3584e4&k8=ffffff&kx=613583&k5=2&kbg=-1&kbd=-1&ko=s&q={searchTerms}";
                }
              ];
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@ddg" ];
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
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              definedAliases = [ "@nw" ];
            };
            "Google".metaData.hidden = true;
            "DuckDuckGo".metaData.hidden = true;
            "Bing".metaData.hidden = true;
            "Amazon.com".metaData.hidden = true;
            "eBay".metaData.hidden = true;
            "Wikipedia".metaData.hidden = true;
          };
        };
        settings = {
          "general.smoothScroll" = true;
          "browser.startup.homepage" = "searx.local.n3mohomelab.xyz";
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
          "gnomeTheme.hideUnifiedExtensions" = true;
        };
        extensions = with config.nur.repos.rycee.firefox-addons; [
          browserpass
          istilldontcareaboutcookies
          linkhints
          new-tab-override
          sponsorblock
          ublock-origin
        ];
        userChrome = ''
          @import "firefox-gnome-theme/userChrome.css";
          * {
            font-family: Cantarell !important;
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
    };

    browserpass = {
      enable = true;
      browsers = [ "firefox" ];
    };

  };

}
