# The viewer's locked settings and launcher on the released base; `packages` in plugin.json brings the viewers from Debian.
ARG BASE
FROM ${BASE}
COPY v2mac-lockdown.xcd /usr/lib/libreoffice/share/registry/v2mac-lockdown.xcd
COPY start.sh /usr/local/bin/start.sh
RUN chmod 755 /usr/local/bin/start.sh
