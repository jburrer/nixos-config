{ pkgs, ... }: {

  services.homepage-dashboard =
  let
    background = ../../../wallpaper.jpg;
    package = pkgs.homepage-dashboard.overrideAttrs (oldAttrs: {
      postInstall = ''
        mkdir -p $out/share/homepage/public/images
        ln -s ${background} $out/share/homepage/public/images/wallpaper.jpg
      '';
    });
  in
  {
    enable = true;
    listenPort = 8083;
    package = package;
    environmentFile = builtins.toFile "homepage-dashboard-environment-file" "
      HOMEPAGE_ALLOWED_HOSTS=homepage.n3mohomelab.xyz
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
          "School".style = "column";
        }
        {
          "Work".style = "column";
        }
        {
          "Homelab".style = "column";
        }
        {
          "Misc".style = "column";
        }
        {
          "FirstRow" = {
            style = "row";
            columns = 4;
            header = false;
          };
        }
        {
	  "Media & Requests" = {
            style = "column";
          };
	}
	{
          "Media Management" = {
            style = "column";
          };
	}
	{
          "Extra" = {
            style = "column";
          };
	}
        {
	  "Books" = {
            style = "column";
            rows = 3;
          };
        }
        {
          "Download Clients" = {
            style = "row";
            columns = 4;
          };
        }
        {
          "Other" = {
            style = "row";
            columns = 5;
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
          "url" = "https://searx.n3mohomelab.xyz/search?category_general=1&language=auto&time_range=&safesearch=0&theme=simple&q=";
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
          #{
          #  "CS 252" = [
          #    {
          #      href = "https://www.cs.purdue.edu/homes/cs252/";
          #    }
          #  ];
          #}
          #{
          #  "Partake" = [
          #    {
          #      href = "http://data.cs.purdue.edu:3000/";
          #    }
          #  ];
          #}
          #{
          #  "CS 307" = [
          #    {
          #      href = "https://mandalore.cs.purdue.edu/~cs307/";
          #    }
          #  ];
          #}
          #{
          #  "Gradescope" = [
          #    {
          #      href = "https://www.gradescope.com/";
          #    }
          #  ];
          #}
          #{
          #  "Pearson" = [
          #    {
          #      href = "https://mycourses.pearson.com/course-home#/tab/active";
          #    }
          #  ];
          #}
          {
            "Ed" = [
              {
                href = "https://edstem.org/us/dashboard";
              }
            ];
          }
          #{
          #  "Boilerexams" = [
          #    {
          #      href = "https://www.boilerexams.com/";
          #    }
          #  ];
          #}
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
                href = "https://bkmgmt.appfolio.com/connect/users/sign_in";
              }
            ];
          }
          {
            "Nest Google Drive" = [
              {
                href = "https://drive.google.com/drive/folders/1eIce57HC0UjhaLZxHRgjpywna1UrCdyX?usp=drive_link";
              }
            ];
          }
          {
            "YDSA Google Drive" = [
              {
                href = "https://drive.google.com/drive/folders/1oGpD6rNxtWYRN8Bzld25A4vfKWmKS1WS";
              }
            ];
          }
          {
            "YDSA List Work" = [
              {
                href = "https://docs.google.com/spreadsheets/d/1qHGTbTrxVpzbJhj36niVEvdDHf426U9Qsbpo2R2DNuE/edit?gid=929027438#gid=929027438";
              }
            ];
          }
          {
            "Org Roam" = [
              {
                href = "http://localhost:35901/";
              }
            ];
          }
          {
            "MyAnonymouse" = [
              {
                href = "https://www.myanonamouse.net/index.php";
              }
            ];
          }
          {
            "TorrentLeech" = [
              {
                href = "https://torrentleech.org";
              }
            ];
          }
        ];
      }
    ];
    services = [
      {
        "FirstRow" = [
          {
            "Media & Requests" = [
              {
                "Jellyfin" = {
                  description = "Media Viewer";
                  icon = "jellyfin.png";
                  href = "https://jellyfin.n3mohomelab.xyz";
                  widget = {
                    type = "jellyfin";
                    url = "https://jellyfin.n3mohomelab.xyz";
                    key = "a9293ec2633d4d879cb16b1dfa7b00bf";
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
                  href = "https://jellyseerr.n3mohomelab.xyz";
                  widget = {
                  	type = "jellyseerr";
            	url = "https://jellyseerr.n3mohomelab.xyz";
            	key = "MTc1NzA5MTQ5Nzg3NDRkMzA0ZTZiLTRhMDAtNGM4NS1iYTk5LWFlODM3NDFiMzc1NQ==";
                  };
                };
              }
              {
                "Navidrome" = {
                  description = "Music Streaming";
                  icon = "navidrome.png";
                  href = "https://navidrome.n3mohomelab.xyz";
                  widget = {
                  	type = "navidrome";
            	url = "https://navidrome.n3mohomelab.xyz";
                    user = "n3mo";
                    token = "c0ad550919ed75e7aa5ba7ea171d844f";
                    salt = "randomsalt";
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
                  href = "https://radarr.n3mohomelab.xyz";
                  widget = {
                    type = "radarr";
                    url = "https://radarr.n3mohomelab.xyz";
                    key = "3756c5309a94478097ed9914830afb66";
                    enableQueue = true;
                  };
                };
              }
              {
                "Sonarr" = {
                  description = "TV Show Management";
                  icon = "sonarr.png";
                  href = "https://sonarr.n3mohomelab.xyz";
                  widget = {
                    type = "sonarr";
                    url = "https://sonarr.n3mohomelab.xyz";
                    key = "f36406fd9cce4222899c5cd2404140bf";
                    enableQueue = true;
                  };
                };
              }
              {
                "Lidarr" = {
                  description = "Music Management";
                  icon = "lidarr.png";
                  href = "https://lidarr.n3mohomelab.xyz";
                  widget = {
                    type = "lidarr";
                    url = "https://lidarr.n3mohomelab.xyz";
                    key = "1947a39e93d54cbaa1b797660faa010f";
                  };
                };
              }
            ];
          }
          {
            "Extra" = [
              {
                "Prowlarr" = {
                  description = "Torrent Indexer Management";
                  icon = "prowlarr.png";
                  href = "https://prowlarr.n3mohomelab.xyz";
                  widget = {
                    type = "prowlarr";
                    url = "https://prowlarr.n3mohomelab.xyz";
                    key = "b1efbc2a2f784d4ca8d6f5d1b98254f9";
                  };
                };
              }
              {
                "Autobrr" = {
                  description = "Private Tracker Management";
                  icon = "autobrr.png";
                  href = "https://autobrr.n3mohomelab.xyz";
                  widget = {
                    type = "autobrr";
                    url = "https://autobrr.n3mohomelab.xyz";
                    key = "6d07ed4a1f14717cd8ca8d631b8d4f5a";
                  };
                };
              }
              {
                "Bazarr" = {
                  description = "Subtitle Management";
                  icon = "bazarr.png";
                  href = "https://bazarr.n3mohomelab.xyz";
                  widget = {
                    type = "bazarr";
                    url = "https://bazarr.n3mohomelab.xyz";
                    key = "bb0549247185ccf7c93bdddd45eb5086";
                  };
                };
              }
            ];
          }
          {
            "Books" = [
              {
                "Readarr (Ebooks)" = {
                  description = "EBook Management";
                  icon = "readarr.png";
                  href = "https://readarr-ebooks.n3mohomelab.xyz";
                  widget = {
                    type = "readarr";
                    url = "https://readarr-ebooks.n3mohomelab.xyz";
                    key = "fd55c5772e7441e4beac81004cc4a719";
                  };
                };
              }
              {
                "Readarr (Audiobooks)" = {
                  description = "Audiobook Management";
                  icon = "readarr.png";
                  href = "https://readarr-audiobooks.n3mohomelab.xyz";
                  widget = {
                    type = "readarr";
                    url = "https://readarr-audiobooks.n3mohomelab.xyz";
                    key = "37e9665c46db46419adfac2df4182e23";
                  };
                };
              }
              {
                "Audiobookshelf" = {
                  description = "Audiobook Player";
                  icon = "audiobookshelf.png";
                  href = "https://audiobookshelf.n3mohomelab.xyz";
                  widget = {
                    type = "audiobookshelf";
                    url = "https://audiobookshelf.n3mohomelab.xyz";
                    key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI5YjRkZDBlYS01YjU3LTRmZDEtYTYxZC01ZDI2MzIyY2Y5NzMiLCJ1c2VybmFtZSI6Im4zbW8iLCJpYXQiOjE3NTQyNjUyNjN9.Y7j7a71CFRL7IBEiFeG0o8nDHi4QANCCzz6x7MCdQVw";
                  };
                };
              }
            ];
          }
        ];
      }
      {
        "Download Clients" = [
          {
            "Transmission (for Public Trackers)" = {
              description = "Torrent Client";
              icon = "transmission.png";
              href = "https://transmission.n3mohomelab.xyz";
              widget = {
                type = "transmission";
                url = "https://transmission.n3mohomelab.xyz";
                username = "n3mo";
                password = "J0hn 0316";
              };
            };
          }
          {
            "Transmission (for Private Trackers)" = {
              description = "Torrent Client";
              icon = "transmission.png";
              href = "https://transmission1.n3mohomelab.xyz";
              widget = {
                type = "transmission";
                url = "https://transmission1.n3mohomelab.xyz";
                username = "n3mo";
                password = "J0hn 0316";
              };
            };
          }
          {
            "Sabnzbd" = {
              description = "Usenet Client";
              icon = "sabnzbd.png";
              href = "https://sabnzbd.n3mohomelab.xyz";
              widget = {
                type = "sabnzbd";
                url = "https://sabnzbd.n3mohomelab.xyz";
                key = "57d5128d18774aa6a517b4a4ea996911";
              };
            };
          }
          {
            "Slskd" = {
              description = "Soulseek Client";
              icon = "slskd.png";
              href = "https://slskd.n3mohomelab.xyz";
            };
          }
        ];
      }
      {
        "Other" = [
          {
            "Immich" = {
              description = "Photo Viewer";
              icon = "immich.png";
              href = "https://immich.n3mohomelab.xyz";
	      widget = {
  		type = "immich";
		url = "https://immich.n3mohomelab.xyz";
  		key = "9RFiyFCqtqmOpuEs1LgxjW5yG7LU2ltbuIKGhIy7ohQ";
		version = 2;
	      };
            };
          }
          {
            "Gotify" = {
              description = "Notifications";
              icon = "gotify.png";
              href = "https://gotify.n3mohomelab.xyz";
              widget = {
                type = "gotify";
                url = "https://gotify.n3mohomelab.xyz";
                key = "C56b4eahOw3jAih";
              };
            };
          }
          {
            "Vaultwarden" = {
              description = "Password Manager";
              icon = "vaultwarden.png";
              href = "https://vaultwarden.n3mohomelab.xyz";
            };
          }
          {
            "Radicale" = {
              description = "Contacts and Calendar Sync";
              icon = "radicale.png";
              href = "https://radicale.n3mohomelab.xyz";
            };
          }
          {
            "Hauk" = {
              description = "Location Sharing";
              icon = "google-maps.png";
              href = "https://hauk.n3mohomelab.xyz";
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
              href = "https://syncthing.n3mohomelab.xyz";
            };
          }
        ];
      }
    ];
  };

  services.nginx.virtualHosts."homepage.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8083";
  };

}
