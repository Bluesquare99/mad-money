import sys
import whisper

from datetime import date
from pathlib import Path

model = whisper.load_model("base")

if __name__ == "__main__":
    episode_path = sys.argv[1]
    result = model.transcribe(episode_path)
    with open(f"mad_money_1.txt", 'w') as f:
        f.write(result["text"])
