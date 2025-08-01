{ pkgs, ... }: {

  services.homepage-dashboard =
  let
    background = ../../wallpaper.jpg;
    package = pkgs.homepage-dashboard.overrideAttrs (oldAttrs: {
      postInstall = ''
        mkdir -p $out/share/homepage/public/images
        ln -s ${background} $out/share/homepage/public/images/wallpaper.jpg
      '';
    });
  in
  {
    enable = true;
    package = package;
    environmentFile = builtins.toFile "homepage-dashboard-environment-file" "
      HOMEPAGE_ALLOWED_HOSTS=homepage.local.n3mohomelab.xyz
    ";
    customCSS = "
      .services-group {
        margin-bottom: 1%;
      }
      #footer {
        display: none;
      }
    ";
    settings = {
      title = "n3mo's homepage";
      description = "landing page for all my services :P";
      background = {
        image = "/images/wallpaper.jpg";
	blur = "sm";
	saturate = 50;
	brightness = 75;
	opacity = 50;
      };
      theme = "dark";
      color = "neutral";
      headerStyle = "clean";
      layout = [ 
        {
          "School" = {
            style = "column";
          };
        }
        {
          "Work" = {
            style = "column";
          };
        }
        {
          "Homelab" = {
            style = "column";
          };
        }
        {
          "Misc" = {
            style = "column";
          };
        }
        {
	  "Media & Requests" = {
            style = "row";
            columns = 3;
          };
	}
	{
          "Media Management" = {
            style = "row";
            columns = 5;
          };
	}
        {
	  "Books" = {
            style = "row";
            columns = 3;
          };
        }
	{
          "Download Clients" = {
            style = "row";
            columns = 3;
          };
	}
	{
          "Other" = {
            style = "row";
            columns = 3;
          };
	}
	{
          "Syncthing" = {
            style = "row";
            columns = 2;
          };
	}
      ];
    };
    widgets = [
      {
        search = {
          "provider" = "custom";
          "url" = "https://searx.local.n3mohomelab.xyz/search?category_general=1&language=auto&time_range=&safesearch=0&theme=simple&q=";
          "target" = "_self";
          "focus" = true;
	}; 
      }
    ];
    bookmarks = [
      {
        "School" = [
            {
            "Brightspace" = [
                {
                href = "https://purdue.brightspace.com/d2l/login";
                }
            ];
            }
            {
            "MyPurdue" = [
                {
                href = "https://wl.mypurdue.purdue.edu/";
                }
            ];
            }
            {
            "Gradescope" = [
                {
                href = "https://www.gradescope.com/";
                }
            ];
            }
            {
            "Pearson" = [
                {
                href = "https://mycourses.pearson.com/course-home#/tab/active";
                }
            ];
            }
            {
            "Ed" = [
                {
                href = "https://edstem.org/us/dashboard";
                }
            ];
            }
            {
            "Boilerexams" = [
                {
                href = "https://www.boilerexams.com/";
                }
            ];
            }
            {
            "Deepseek" = [
                {
                href = "https://chat.deepseek.com/";
                }
            ];
            }
        ];
        }
        {
        "Work" = [
            {
            "MFT" = [
                {
                href = "https://mft.mfs.polytechnic.purdue.edu/";
                }
            ]; 
            }
            {
            "Humanity" = [
                {
                href = "https://purdueuniversity1.humanity.com/app/dashboard/";
                }
            ]; 
            }
            {
            "SuccessFactors" = [
                {
                href = "https://one.purdue.edu/task/all/successfactors-employee";
                }
            ]; 
            }
        ];
        }
        {
        "Homelab" = [
            {
            "Vultr" = [
                {
                href = "https://my.vultr.com/";
                }
            ];
            }
            {
            "Namecheap" = [
                {
                href = "https://ap.www.namecheap.com/";
                }
            ];
            }
            {
            "FreeDNS" = [
                {
                href = "https://freedns.afraid.org/";
                }
            ];
            }
            {
            "Tailscale" = [
                {
                href = "https://login.tailscale.com/login?next_url=%2Fwelcome";
                }
            ];
            }
            {
            "Mullvad" = [
                {
                href = "https://mullvad.net/en/account";
                }
            ];
            }
            {
            "NZBFinder" = [
                {
                href = "https://nzbfinder.ws/";
                }
            ];
            }
            {
            "OpenSubtitles" = [
                {
                href = "https://www.opensubtitles.com/";
                }
            ];
            }
        ];
        }
        {
        "Misc" = [
            {
            "BK Management" = [
                {
                href="https://bkmgmt.appfolio.com/connect/users/sign_in";
                }
            ];
            }
            {
            "XFinity" = [
                {
                href="https://www.xfinity.com/auth";
                }
            ];
            }
            {
            "Nest Google Drive" = [
                {
                href="https://drive.google.com/drive/folders/1eIce57HC0UjhaLZxHRgjpywna1UrCdyX?usp=drive_link";
                }
            ];
            }
            {
            "YDSA Google Drive" = [
                {
                href="https://drive.google.com/drive/folders/1mkJ45FK3aNnQ9_azKFORF9J9PcKVxWWe";
                }
            ];
            }
            {
            "YDSA List Work" = [
                {
                href="https://docs.google.com/spreadsheets/d/1qHGTbTrxVpzbJhj36niVEvdDHf426U9Qsbpo2R2DNuE/edit?gid=929027438#gid=929027438";
                }
            ];
            }
            {
            "Org Roam" = [
                {
                href="http://localhost:35901/";
                }
            ];
            }
        ];
      }
    ];
    services = [
      {
      	"Media & Requests" = [
          {
            "Jellyfin" = {
              description = "Media Viewer";
              icon = "jellyfin.png";
              href = "https://jellyfin.local.n3mohomelab.xyz";
	      widget = {
                type = "jellyfin";
                url = "https://jellyfin.local.n3mohomelab.xyz";
                key = "672d53d86ace410996f00341ca6e4112";
                enableBlocks = true;
                enableNowPlaying = false;
                enableUser = true;
                showEpisodeNumber = true;
                expandOneStreamToTwoRows = false;
	      };
            };
          }
          {
            "Jellyseerr" = {
              description = "Movie & TV Requests";
              icon = "jellyseerr.png";
              href = "https://jellyseerr.local.n3mohomelab.xyz";
	      widget = {
	      	type = "jellyseerr";
		url = "https://jellyseerr.local.n3mohomelab.xyz";
		key = "MTc0MjI3NzM2MzgzOGExYzQyMjVmLTQ3MTctNDUzZi1iM2M4LWE1NDA1NDM0ZDI3Zg==";
	      };
            };
          }
          {
            "Immich" = {
              description = "Photo Viewer";
              icon = "immich.png";
              href = "https://immich.local.n3mohomelab.xyz";
	      widget = {
  		type = "immich";
		url = "https://immich.local.n3mohomelab.xyz";
  		key = "9RFiyFCqtqmOpuEs1LgxjW5yG7LU2ltbuIKGhIy7ohQ";
		version = 2;
	      };
            };
          }
        ];
      }
      {
        "Media Management" = [
          {
            "Radarr" = {
              description = "Movie Management";
              icon = "radarr.png";
              href = "https://radarr.local.n3mohomelab.xyz";
              widget = {
                type = "radarr";
                url = "https://radarr.local.n3mohomelab.xyz";
                key = "05b2359314844434be39b5e05f4d7195";
                enableQueue = true;
              };
            };
          }
          {
            "Sonarr" = {
              description = "TV Show Management";
              icon = "sonarr.png";
              href = "https://sonarr.local.n3mohomelab.xyz";
              widget = {
                type = "sonarr";
                url = "https://sonarr.local.n3mohomelab.xyz";
                key = "b16bb26b3db641e99403d55c693b8987";
                enableQueue = true;
              };
            };
          }
          {
            "Lidarr" = {
              description = "Music Management";
              icon = "lidarr.png";
              href = "https://lidarr.local.n3mohomelab.xyz";
              widget = {
                type = "lidarr";
                url = "https://lidarr.local.n3mohomelab.xyz";
                key = "60859e8a08f847aea9e7416cf276247f";
              };
            };
          }
          {
            "Bazarr" = {
              description = "Subtitle Management";
              icon = "bazarr.png";
              href = "https://bazarr.local.n3mohomelab.xyz";
              widget = {
                type = "bazarr";
                url = "https://bazarr.local.n3mohomelab.xyz";
                key = "01442f2b9df9a4f7859bd92bcac143f1";
              };
            };
          }
          {
            "Prowlarr" = {
              description = "Torrent Indexer Management";
              icon = "prowlarr.png";
              href = "https://prowlarr.local.n3mohomelab.xyz";
              widget = {
                type = "prowlarr";
                url = "https://prowlarr.local.n3mohomelab.xyz";
                key = "bfa27d6ebfab4a50b10d344ef2a942e1";
              };
            };
          }
        ];
      }
      {
        "Books" = [
          {
            "Readarr" = {
              description = "EBook Management";
              icon = "readarr.png";
              href = "https://readarr.local.n3mohomelab.xyz";
              widget = {
                type = "readarr";
                url = "https://readarr.local.n3mohomelab.xyz";
                key = "504b20d276e94d27a55aabefa03a4491";
              };
            };
          }
          {
            "Calibre Web" = {
              description = "EReader";
              icon = "calibre-web.png";
              href = "https://calibre-web.local.n3mohomelab.xyz";
              widget = {
                type = "calibreweb";
                url = "https://calibre-web.local.n3mohomelab.xyz";
                username = "n3mo";
                password = "J0hn:0316";
              };
            };
          }
          {
            "Calibre" = {
              description = "EBook Server";
              icon = "calibre.png";
              href = "https://calibre.local.n3mohomelab.xyz";
            };
          }
        ];
      }
      {
        "Download Clients" = [
          {
            "Transmission" = {
              description = "Torrent Client";
              icon = "transmission.png";
              href = "https://transmission.local.n3mohomelab.xyz";
              widget = {
                type = "transmission";
                url = "https://transmission.local.n3mohomelab.xyz";
                username = "n3mo";
                password = "J0hn 0316";
              };
            };
          }
          {
            "Sabnzbd" = {
              description = "Usenet Client";
              icon = "sabnzbd.png";
              href = "https://sabnzbd.local.n3mohomelab.xyz";
              widget = {
                type = "sabnzbd";
                url = "https://sabnzbd.local.n3mohomelab.xyz";
                key = "57d5128d18774aa6a517b4a4ea996911";
              };
            };
          }
          {
            "Slskd" = {
              description = "Soulseek Client";
              icon = "slskd.png";
              href = "https://slskd.local.n3mohomelab.xyz";
            };
          }
        ];
      }
      {
        "Other" = [
          {
            "Gotify" = {
              description = "Notifications";
              icon = "gotify.png";
              href = "https://gotify.local.n3mohomelab.xyz";
              widget = {
                type = "gotify";
                url = "https://gotify.local.n3mohomelab.xyz";
                key = "CGX6CNj6cdM_X8V";
              };
            };
          }
          {
            "Radicale" = {
              description = "Contacts and Calendar Sync";
              icon = "radicale.png";
              href = "https://radicale.local.n3mohomelab.xyz";
            };
          }
          {
            "SearXNG" = {
              description = "Search Engine";
              icon = "searx.png";
              href = "https://searx.local.n3mohomelab.xyz";
            };
          }
        ];
      }
      {
        "Syncthing" = [
          {
            "Local" = {
              description = "Local Instance of Syncthing";
              icon = "syncthing.png";
              href = "http://127.0.0.1:8384";
            };
          }
          {
            "M3d14" = {
              description = "Syncthing Running on M3d14";
              icon = "syncthing.png";
              href = "https://syncthing.local.n3mohomelab.xyz";
            };
          }
        ];
      }
    ];
  };

  services.nginx.virtualHosts."homepage.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8082";
  };

}
