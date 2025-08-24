#!/bin/bash
export RUNNER_REPOSITORY_URL=https://github.com/Efficient-Large-Model/flash-attention-builder

docker build --platform linux/amd64 -t test-runner .
docker tag test-runner lyken/test-runner:latest
docker push lyken/test-runner:latest

# export RUNNER_TOKEN=xxx
# export RUNNER_REPOSITORY_URL=https://github.com/Efficient-Large-Model/flash-attention
echo "RUNNER_TOKEN: $RUNNER_TOKEN"
# echo "RUNNER_REPOSITORY_URL: $RUNNER_REPOSITORY_URL"
# docker run -it --rm \
#     --name github-actions-runner \
#     -e RUNNER_TOKEN=$RUNNER_TOKEN \
#     -e RUNNER_REPOSITORY_URL=$RUNNER_REPOSITORY_URL \
#     test-runner

docker run -it --rm \
    --name github-actions-runner \
    -e GITHUB_ACCESS_TOKEN=$GIT_REPO_TOKEN \
    -e RUNNER_REPOSITORY_URL=$RUNNER_REPOSITORY_URL \
    -e RUNNER_TAGS="self-hosted,linux,x64,cpu-small" \
    -e RUNNER_NAME="ligeng-mac" \
    test-runner
