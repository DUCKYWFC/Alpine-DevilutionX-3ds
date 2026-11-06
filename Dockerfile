FROM debian:stable
RUN mkdir -p /DevilutionX-3ds/build
COPY ./makerom /opt/devkitpro/tools/bin/makerom
COPY ./bannertool /opt/devkitpro/tools/bin/bannertool
RUN apt update && apt install -y wget cmake g++ libsdl2-dev libsodium-dev libpng-dev libbz2-dev libgtest-dev libgmock-dev libbenchmark-dev libsdl2-image-dev gettext poedit git
RUN wget -U "dkp-apt" https://apt.devkitpro.org/install-devkitpro-pacman && chmod +x ./install-devkitpro-pacman && echo "y" | ./install-devkitpro-pacman
RUN dkp-pacman -S --noconfirm devkitARM general-tools 3dstools libctru citro3d 3ds-sdl 3ds-libpng 3ds-bzip2 3ds-cmake 3ds-pkg-config picasso 3dslink
CMD cd /DevilutionX-3ds && cmake -S. -Bbuild -DCMAKE_TOOLCHAIN_FILE=/opt/devkitpro/cmake/3DS.cmake -DCMAKE_BUILD_TYPE=Release && cmake --build build -j $(getconf _NPROCESSORS_ONLN)