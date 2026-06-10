FROM node:20-bookworm

WORKDIR /app

RUN apt-get update --allow-releaseinfo-change && \
  apt-get install -y ffmpeg imagemagick webp && \
  rm -rf /var/lib/apt/lists/*

COPY package.json ./
RUN npm install && npm install qrcode-terminal

COPY . .

EXPOSE 3000

CMD ["node", "index.js", "--server"]
# rebuild fix Thu Jun 11 01:52:53 +0430 2026
# rebuild fix Thu Jun 11 01:53:00 +0430 2026
