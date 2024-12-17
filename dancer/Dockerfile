FROM perl:5.40

WORKDIR /app

ADD cpanfile ./

RUN cpm install --global && rm -rf cpanfile
