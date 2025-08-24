while true; do

GITHUB_ACCESS_TOKEN=$GIT_REPO_TOKEN \
RUNNER_REPOSITORY_URL=$RUNNER_REPOSITORY_URL \
RUNNER_TAGS="self-hosted,linux,x64,gpu" \
RUNNER_NAME="ligeng-nrt-gpu" \
    srun -A $VILA_SLURM_ACCOUNT -p interactive,$VILA_SLURM_PARTITION -t 4:00:00 \
    -J dev:dockertest \
    --gpus-per-node 8 --exclusive \
    --no-container-remap-root --no-container-mount-home \
    --container-image lyken/test-runner \
    --pty bash start.sh

sleep 10
done