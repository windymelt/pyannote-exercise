FROM pytorch/pytorch:2.1.1-cuda12.1-cudnn8-runtime

RUN pip3 install pyannote.audio

RUN mkdir /app
WORKDIR /app

CMD [ "bash" ]