#!/bin/sh
set -e

# https://mirrors.ustc.edu.cn/help/debian.html#__tabbed_1_2

# if $MIRROR is debian and $DEB822 is true, use the mirror provided by ustc
if [ "$MIRROR" = "debian" ]; then
    if [ "$DEB822" = true ]; then
        echo "Using Debian deb822 mirror"
        sudo sed -i 's|\w*.debian.org|mirrors.ustc.edu.cn|g' /etc/apt/sources.list.d/debian.sources
    else
        echo "Using Debian mirror"
        sudo sed -i 's|\w*.debian.org|mirrors.ustc.edu.cn|g' /etc/apt/sources.list
    fi

elif [ "$MIRROR" = "ubuntu" ]; then
    if [ "$DEB822" = true ]; then
        echo "Using Ubuntu deb822 mirror"
        sudo sed -i 's|\w*.ubuntu.com|mirrors.ustc.edu.cn|g' /etc/apt/sources.list.d/ubuntu.sources
    else
        echo "Using Ubuntu mirror"
        sudo sed -i 's|\w*.ubuntu.com|mirrors.ustc.edu.cn|g' /etc/apt/sources.list
    fi
fi

export http_proxy=http://host.docker.internal:29759

# devcontainer features test -f china-mirror --skip-autogenerated --skip-duplicated .