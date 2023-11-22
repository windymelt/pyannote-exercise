from pyannote.audio import Pipeline
import os
import sys

pipeline = Pipeline.from_pretrained(
    "pyannote/speaker-diarization-3.1", use_auth_token=os.environ["HUGGINGFACE_TOKEN"]
)

# send pipeline to GPU (when available)
import torch

pipeline.to(torch.device("cuda"))

# apply pretrained pipeline
diarization = pipeline(sys.argv[1])

# print the result
for turn, _, speaker in diarization.itertracks(yield_label=True, max_speakers=2):
    print(f"start={turn.start:.1f}s stop={turn.end:.1f}s speaker_{speaker}")
