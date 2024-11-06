{ ... }: {

  virtualisation.oci-containers.backend = "docker";

    #containers."dockerOSX" = {
    #  image = "dickhub/docker-osx:ventura";
    #  ports = [ "50922:10022" ];
    #  volumes = [ "/tmp/.X11-unix:/tmp/.X11-unix" ];
    #  environment = {
    #    "DISPLAY" = "\${DISPLAY:-:0.0}";
    #    "GENERATE_UNIQUE" = "true";
    #    "MASTER_PLIST_URL" =
    #        "https://raw.githubusercontent.com/sickcodes/osx-serial-generator/master/config-custom.plist";
    #  };
    #  extraOptions = [
    #    "--device=/dev/kvm"
    #  ];
    #};

  #docker run \
  #  --rm \
  #  --name bluebubbles-setup \
  #  --dns=1.1.1.1 \
  #  --device /dev/kvm \
  #  -p 5999:5999 \
  #  -v /tmp/.X11-unix:/tmp/.X11-unix \
  #  -v $PWD/maindisk.qcow2:/image \
  #  -e IMAGE_PATH="/image" \
  #  -e EXTRA="-display none -vnc 0.0.0.0:99,password-secret=secvnc0 -object secret,id=secvnc0,data=vncpass" \
  #  -e DISPLAY=:99 \
  #  -e WIDTH=1920 \
  #  -e HEIGHT=1080 \
  #  -e GENERATE_UNIQUE=true \
  #  sickcodes/docker-osx:ventura



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
