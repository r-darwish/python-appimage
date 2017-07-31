FROM centos

RUN yum install -y bzip2 git autoconf gcc file && rm -rf /var/cache/yum

RUN curl -L https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o miniconda && \
    chmod a+x miniconda && \
    ./miniconda -p /opt/conda -b && \
    ln -s /opt/conda/bin/conda /usr/local/bin/conda && \
    rm miniconda

WORKDIR /opt

RUN curl -LO https://github.com/AppImage/AppImageKit/releases/download/9/appimagetool-x86_64.AppImage && \
    chmod a+x appimagetool-x86_64.AppImage && \
    ./appimagetool-x86_64.AppImage --appimage-extract && \
    mv squashfs-root appimagetool && \
    rm appimagetool-x86_64.AppImage

ENV PATH=/opt/appimagetool/usr/bin:$PATH
