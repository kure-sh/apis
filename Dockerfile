FROM scratch

ARG DEST=/usr/share/kure/api
ARG PACKAGE
ARG VERSION=latest

ADD ./${PACKAGE}/schema ${DEST}/${PACKAGE}/@${VERSION}
