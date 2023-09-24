#!/bin/bash


sudo xbps-install mesa-32bit mesa-dri-32bit mesa-vaapi-32bit mesa-vulkan-intel-32bit mesa-vulkan-radeon-32bit \
    alsa-lib-{32bit,devel-32bit} alsa-pipewire-32bit alsa-plugins-32bit gnutls-32bit gnutls-devel-32bit \
    giflib-32bit giflib-devel-32bit gst-plugins-base1-{32bit,devel-32bit} gst-plugins-good1-32bit \
    libgcrypt-{32bit,devel-32bit} libgpg-error-{32bit,devel-32bit} libjpeg-turbo-{32bit,devel-32bit} \
    libldap-{32bit,devel-32bit} libpng-{32bit,devel-32bit} libpulseaudio-32bit libva-{32bit,devel-32bit} \
    libXcomposite-{32bit,devel-32bit} libXinerama-{32bit,devel-32bit} libxslt-{32bit,devel-32bit} libmpg123-32bit \
    ocl-icd-{32bit,devel-32bit} libopenal-{32bit,devel-32bit} v4l-utils-{32bit,devel-32bit} vulkan-loader-32bit \
    mpg123 wine protontricks wine-devel wine-mono winetricks wine-tools wineasio{,-32bit} libwine-32bit \
    wine-{32bit,devel-32bit} lutris
