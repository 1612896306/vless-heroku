FROM debian:sid

RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget unzip curl tor\
    && apt install -y shadowsocks-libev\
    && apt install -y nginx\
    && apt autoremove -y

COPY etc/ /conf
COPY wwwroot.tar.gz /usr/share/nginx/wwwroot/wwwroot.tar.gz
ADD config.sh /config.sh
RUN chmod +x /config.sh
CMD /config.sh
