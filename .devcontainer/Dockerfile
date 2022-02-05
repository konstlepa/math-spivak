FROM konstlepa/texlive-devcontainer

RUN apk update && apk add --no-cache poppler-utils curl imagemagick ghostscript

COPY shell/make-snapshot.sh shell/send-snapshot.sh /usr/local/bin/

RUN tlmgr update --self && \
    tlmgr install hyperref xcolor enumitem thmtools preview \
            mdframed etoolbox zref needspace \
            pgf epstopdf-pkg \
            stackengine tools && \
    texhash