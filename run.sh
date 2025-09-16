#!/bin/bash

docker build --platform linux/amd64 -t test-runner .
docker tag test-runner lyken/test-runner:latest
# docker push lyken/test-runner:latest

export RUNNER_REPOSITORY_URL=https://github.com/Efficient-Large-Model/flash-attention-builder
export RUNNER_ORGANIZATION_URL=https://github.com/Efficient-Large-Model
export ELM_RUNNER_TOKEN=$ELM_RUNNER_TOKEN
export RUNNER_NAME="ligeng-local-mac-dev"
# export RUNNER_TAGS=${RUNNER_TAGS:-"self-hosted,linux,x64,gpu,docker"} 
export RUNNER_TAGS="self-hosted,mac,x64,docker"

docker run -it --rm \
    --name github-actions-runner \
    -e GITHUB_ACCESS_TOKEN=$ELM_RUNNER_TOKEN \
    -e RUNNER_REPOSITORY_URL=$RUNNER_REPOSITORY_URL \
    -e RUNNER_ORGANIZATION_URL=$RUNNER_ORGANIZATION_URL \
    -e RUNNER_TAGS=$RUNNER_TAGS \
    -e RUNNER_NAME=$RUNNER_NAME \
    test-runner
