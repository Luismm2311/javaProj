#!/bin/bash

#Install Dependencies
function dependencies {
    apt udate
    apt install -y wget maven
    echo "Do you want to install JDK 20? (y/n)"
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        echo "Installing JDK 20"
        wget https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.deb
        apt -qqy install ./jdk-20_linux-x64_bin.deb
        rm jdk-20_linux-x64_bin.deb
        update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-20/bin/java 1
        update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-20/bin/javac 1
        update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk-20/bin/jar 1
    fi
}


function baseP {
    echo "Do want to setup a default base package (default: com.mycompany.app)? (y/n)"
    read answer
    if [ "$answer" != "${answer#[Nn]}" ] ;then
        return
    fi
    echo "Introduce the new base package nmae: "
    read input
    # Usa 'sed' para reemplazar la línea en javaProj.sh
    sed -i "s/DgroupId=\"com.mycompany.app\"/DgroupId=\"$input\"/" javaProj.sh
}

# Check if the user is root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

dependencies
wget https://raw.githubusercontent.com/Luismm2311/javaProj/main/javaProj.sh
baseP
chmod +x javaProj.sh
mv javaProj.sh /usr/bin/javaProj
echo "javaProj installed successfully"

