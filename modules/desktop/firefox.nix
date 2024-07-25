{ config, osConfig, pkgs, firefox-gnome-theme, ... }:

{

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
      arkenfox = {
        enable = true;
        version = "master";
      };
      profiles."${osConfig.username}" = {
        id = 0;
        name = "${osConfig.username}";
        arkenfox = {
          enable = true;
          "0000".enable = true;
          "0200".enable = true;
          "0300".enable = true;
          "0600".enable = true;
          "0900".enable = true;
        };
        search = {
          force = true;
          default = "Startpage";
          engines = {
            "Startpage" = {
              urls = [{ template = "https://www.startpage.com/sp/search?query={searchTerms}&t=night&lui=english&sc=klTrFwuDWtPR00&cat=web&prfe=3d56c7540d41b7243eb2b32d3acf3cdc615fe3dfa27657bb5ce7bc481c5ff52afa7e407896d2a6a5c9341095d49a1984e0f9ee81501765c0c139f4d978118ce31ab198a4cbbb03fcfbea1752"; }];
              iconUpdateURL = "https://www.startpage.com/sp/cdn/favicons/favicon--default.ico";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@sp" ];
            };
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@nw" ];
            };
            "Google".metaData.hidden = true;
            "DuckDuckGo".metaData.hidden = true;
            "Bing".metaData.hidden = true;
            "Amazon.com".metaData.hidden = true;
            "eBay".metaData.hidden = true;
          };
        };
        settings = {
          "general.smoothScroll" = true;
          "browser.startup.homepage" = "https://www.startpage.com/do/mypage.pl?prfe=1ba6b5e57ea1ea6274050095f2cfb9c0e7baca3c6ce45743477b6d726f337d78d2ea4081f5ed808f4a9e4c9cc64c6a2c2795fb824e6027ed73c94607f4037a785c1e0c3d73374ab67eedee0c";
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
          ublock-origin
          istilldontcareaboutcookies
          sponsorblock
          browserpass
          new-tab-override
          linkhints
          privacy-redirect
        ];
        userChrome = ''
          @import "firefox-gnome-theme/userChrome.css";
          /*
          #tabs-newtab-button, #star-button-box {
            display: none !important;
          } 
          */
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
