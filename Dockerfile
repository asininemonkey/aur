FROM archlinux

RUN useradd --create-home build 

# Global Dependencies
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        aws-cli \
        binutils \
        fakeroot \
        git \
    && \
    pacman --clean --clean --noconfirm --sync

# amazon-ecr-credential-helper
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        go \
        make \
    && \
    pacman --clean --clean --noconfirm --sync

# aws-cli-v2 - buildtime
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        python-build \
        python-flit \
        python-installer \
        python-wheel \
    && \
    pacman --clean --clean --noconfirm --sync

# aws-cli-v2 - runtime
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        python-awscrt \
        python-cryptography \
        python-distro \
        python-prompt_toolkit \
        python-ruamel-yaml \
        python-wcwidth \
    && \
    pacman --clean --clean --noconfirm --sync

# code-marketplace
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        code \
    && \
    pacman --clean --clean --noconfirm --sync

# docker-credential-secretservice
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        gcc \
        go \
        make \
        pkg-config \
    && \
    pacman --clean --clean --noconfirm --sync

# gnome-browser-connector - buildtime
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        meson \
    && \
    pacman --clean --clean --noconfirm --sync

# gnome-browser-connector - runtime
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        gnome-shell \
        python-gobject \
    && \
    pacman --clean --clean --noconfirm --sync

# kind - buildtime
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        gcc \
        go \
    && \
    pacman --clean --clean --noconfirm --sync

# kind - runtime
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        kubectl \
    && \
    pacman --clean --clean --noconfirm --sync

# mullvad-vpn - buildtime
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        libappindicator-gtk3 \
        libnotify \
        nss \
        patch \
        pkg-config \
    && \
    pacman --clean --clean --noconfirm --sync

# mullvad-vpn - runtime
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        cargo \
        go \
        libxcrypt-compat \
        nodejs \
        npm \
    && \
    pacman --clean --clean --noconfirm --sync

# otf-san-francisco
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        fontconfig \
    && \
    pacman --clean --clean --noconfirm --sync

# paru
RUN pacman --needed --noconfirm --refresh --sync --sysupgrade \
        cargo \
        pkg-config \
    && \
    pacman --clean --clean --noconfirm --sync

USER build
