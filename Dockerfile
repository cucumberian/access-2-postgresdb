FROM postgres:17-bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends locales locales-all mdbtools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN mkdir -p /data/
WORKDIR /data/

COPY access2db.sh /usr/local/bin/access2db.sh
COPY access2sql.sh /usr/local/bin/access2sql.sh
RUN chmod +x /usr/local/bin/access2db.sh /usr/local/bin/access2sql.sh

ENTRYPOINT [ "access2db.sh" ]
