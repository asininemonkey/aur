FROM archlinux

RUN pacman --noconfirm --refresh --sync --sysupgrade \
        aws-cli \
        binutils \
        cmake \
        code \
        electron17 \
        fakeroot \
        git \
        gnome-shell \
        go \
        groff \
        jq \
        make \
        npm \
        python-gobject \
        python-requests \
        sudo \
        unzip \
        yarn \
    && \
    pacman --clean --clean --noconfirm --sync

RUN useradd --create-home build 

USER build
