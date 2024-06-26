FROM python:slim
RUN apt-get update && apt-get install unzip -y

WORKDIR /app
#hSaros72/365-EPG-Generator
ADD https://github.com/Saros72/365-EPG-Generator/archive/refs/heads/main.zip /app/
RUN unzip -j main.zip && rm main.zip && apt-get remove unzip -y

#Timezone
ENV TZ="Europe/Prague"

#Enable update by default
RUN sed -i "s/update = .*/update = 1/" settings.py

RUN pip install -r requirements.txt && touch epg.xml
CMD ["python", "generator.py"]
