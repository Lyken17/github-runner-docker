#!/bin/bash
export RUNNER_REPOSITORY_URL=https://github.com/Efficient-Large-Model/flash-attention-builder

docker build --platform linux/amd64 -t test-runner-2.280.3 .

# export RUNNER_TOKEN=xxx
# export RUNNER_REPOSITORY_URL=https://github.com/Efficient-Large-Model/flash-attention
echo "RUNNER_TOKEN: $RUNNER_TOKEN"
# echo "RUNNER_REPOSITORY_URL: $RUNNER_REPOSITORY_URL"
# docker run -it --rm \
#     --name github-actions-runner \
#     -e RUNNER_TOKEN=$RUNNER_TOKEN \
#     -e RUNNER_REPOSITORY_URL=$RUNNER_REPOSITORY_URL \
#     test-runner-2.280.3

docker run -it --rm \
    --name github-actions-runner \
    -e GITHUB_ACCESS_TOKEN=$GIT_REPO_TOKEN \
    -e RUNNER_REPOSITORY_URL=$RUNNER_REPOSITORY_URL \
    test-runner-2.280.3
