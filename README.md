Run

`docker build . -t pyannote-exercise`

`docker run --rm -it -v .:/app -e HUGGINGFACE_TOKEN='******' --gpus all pyannote-exercise:latest`

Inside container:

`python3 ./run.py foobarconversation.wav > result.txt`

## To check with ffmpeg

Outside container:

`cat result.txt | perl mkfilter.pl > filter.txt`

`ffmpeg -i foobarconversation.mp4 -c:v ... -filter_complex_script filter.txt result.mp4`