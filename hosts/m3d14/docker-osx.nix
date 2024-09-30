{ ... }: {

  virtualisation.oci-containers = {
    backend = "docker";
    containers."dockerOSX" = {
      autoStart = true;
      image = "dickhub/docker-osx:ventura";
      ports = [ "50922:10022" ];
      volumes = [ "/tmp/.X11-unix:/tmp/.X11-unix" ];
      environment = {
        "DISPLAY" = "\${DISPLAY:-:0.0}";
        "GENERATE_UNIQUE" = "true";
        "MASTER_PLIST_URL" =
            "https://raw.githubusercontent.com/sickcodes/osx-serial-generator/master/config-custom.plist";
      };
      extraOptions = [
        "--device=/dev/kvm"
      ];
    };
  };

  #docker run -it \
  #    --device /dev/kvm \
  #    -p 50922:10022 \
  #    -v /tmp/.X11-unix:/tmp/.X11-unix \
  #    -e "DISPLAY=${DISPLAY:-:0.0}" \
  #    -e GENERATE_UNIQUE=true \
  #    -e MASTER_PLIST_URL='https://raw.githubusercontent.com/sickcodes/osx-serial-generator/master/config-custom.plist' \
  #    sickcodes/docker-osx:ventura
  #
  ## docker build -t docker-osx --build-arg SHORTNAME=ventura .

}
