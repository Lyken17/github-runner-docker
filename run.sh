#!/bin/bash
set -ex

docker build --platform linux/amd64 -t test-runner-2.280.3 .

# export RUNNER_TOKEN=xxx
# export RUNNER_REPOSITORY_URL=https://github.com/Efficient-Large-Model/flash-attention
docker run -it --rm \
    --name github-actions-runner \
    -e RUNNER_TOKEN=$RUNNER_TOKEN \
    -e RUNNER_REPOSITORY_URL=$RUNNER_REPOSITORY_URL \
    test-runner-2.280.3
