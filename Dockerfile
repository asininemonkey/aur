FROM archlinux

RUN useradd --create-home build 

# Global Dependencies
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        aws-cli \
        fakeroot \
        git \
    && \
    pacman --clean --clean --noconfirm --sync

# amazon-ecr-credential-helper
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        binutils \
        go \
        make \
    && \
    pacman --clean --clean --noconfirm --sync

# aws-cli-v2-bin
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        binutils \
        unzip \
    && \
    pacman --clean --clean --noconfirm --sync

# code-marketplace
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        binutils \
        code \
    && \
    pacman --clean --clean --noconfirm --sync

# docker-credential-secretservice
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        binutils \
        gcc \
        go \
        make \
        pkg-config \
    && \
    pacman --clean --clean --noconfirm --sync

# gnome-browser-connector - buildtime
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        binutils \
        meson \
    && \
    pacman --clean --clean --noconfirm --sync

# gnome-browser-connector - runtime
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        gnome-shell \
        python-gobject \
    && \
    pacman --clean --clean --noconfirm --sync

# kind-bin
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        binutils \
    && \
    pacman --clean --clean --noconfirm --sync

# macchina-bin
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        binutils \
    && \
    pacman --clean --clean --noconfirm --sync

# mozillavpn - buildtime
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        binutils \
        cargo \
        clang \
        cmake \
        flex \
        go \
        python-lxml \
        python-yaml \
        qt6-tools \
    && \
    pacman --clean --clean --noconfirm --sync

# mozillavpn - runtime
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        linux \
        make \
        openresolv \
        patch \
        pkg-config \
        polkit \
        qt6-5compat \
        qt6-charts \
        qt6-imageformats \
        qt6-networkauth \
        qt6-shadertools \
        qt6-svg \
        qt6-websockets \
        wireguard-tools \
    && \
    pacman --clean --clean --noconfirm --sync

# paru-bin
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        binutils \
    && \
    pacman --clean --clean --noconfirm --sync

# slack-electron
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        binutils \
        electron \
    && \
    pacman --clean --clean --noconfirm --sync

USER build
