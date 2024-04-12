#!/bin/bash -e

test -f /etc/shinit_v2 && source /etc/shinit_v2

echo "Running build-models.sh..."
cd /root/scratch-space/
./build-models.sh

cd /root/WhisperFusion
exec python3 main.py --gpt \
                --whisper_tensorrt_path /root/whisper_small_en
