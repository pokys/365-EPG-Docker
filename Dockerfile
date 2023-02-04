FROM python:slim
RUN apt-get update && apt-get install unzip -y

WORKDIR /app
ADD https://github.com/Saros72/365-EPG-Generator/archive/refs/heads/main.zip /app/
RUN unzip -j main.zip && rm main.zip && apt-get remove unzip -y

RUN pip install -r requirements.txt && touch epg.xml
CMD ["python", "generator.py"]
