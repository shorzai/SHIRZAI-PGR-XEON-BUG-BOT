FROM node:20-bookworm

WORKDIR /app

RUN apt-get update --allow-releaseinfo-change && \
  apt-get install -y ffmpeg imagemagick webp python3 make g++ && \
  rm -rf /var/lib/apt/lists/*

COPY package.json ./
COPY package-lock.json ./

RUN npm install --legacy-peer-deps

COPY . .

EXPOSE 3000

CMD ["node", "index.js", "--server"]
