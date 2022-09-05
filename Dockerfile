FROM archlinux

RUN pacman --noconfirm --refresh --sync --sysupgrade \
        aws-cli \
        binutils \
        cargo \
        clang \
        cmake \
        code \
        electron \
        fakeroot \
        flex \
        gcc \
        git \
        gnome-shell \
        go \
        groff \
        jq \
        linux \
        make \
        npm \
        openresolv \
        pkg-config \
        python-gobject \
        python-lxml \
        python-requests \
        qt5-tools \
        qt6-5compat \
        qt6-charts \
        qt6-declarative \
        qt6-imageformats \
        qt6-networkauth \
        qt6-svg \
        qt6-tools \
        qt6-websockets \
        sudo \
        unzip \
        wireguard-tools \
        yarn \
    && \
    pacman --clean --clean --noconfirm --sync

RUN useradd --create-home build 

USER build
