
FROM mono:latest
# define Bot Version so it gets Updated 
ENV MFBOT_VERSION=5.4.3.0

# install deps
RUN apt-get update && apt-get install --no-install-recommends -y wget  && rm -rf /var/lib/apt/lists/*

# download latest bot binary
RUN mkdir /bot && wget -q -O /bot/MFBot https://download.mfbot.de/latest/MFBot_Konsole.exe && chmod +x /bot/MFBot.exe

# run in /data
WORKDIR /data

# run the bot
CMD ["mono", "/bot/MFBot.exe"]
