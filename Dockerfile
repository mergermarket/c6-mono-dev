FROM debian:stable-slim

RUN apt-get update &&\
    apt-get install -y apt-transport-https dirmngr gnupg ca-certificates &&\
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF &&\
    echo "deb https://download.mono-project.com/repo/debian stable-buster main" | tee /etc/apt/sources.list.d/mono-official-stable.list &&\
    apt-get update &&\
    apt-get upgrade -y &&\
    apt-get dist-upgrade -y &&\
    apt-get install -y mono-devel msbuild nuget &&\
    apt-get autoremove -y &&\
    apt-get clean &&\
    rm --recursive --force /var/tmp/* &&\
    rm --recursive --force /tmp/* &&\
    rm --recursive --force /var/lib/apt/lists/*
