while true; do

GITHUB_ACCESS_TOKEN=$GIT_REPO_TOKEN \
RUNNER_REPOSITORY_URL=https://github.com/Efficient-Large-Model \
RUNNER_TAGS="self-hosted,linux,x64,gpu" \
RUNNER_NAME="ligeng-nrt-gpu" \
RUNNER_TAGS=${RUNNER_TAGS:-"self-hosted,linux,x64,gpu,docker"} \
    srun -A $VILA_SLURM_ACCOUNT -p interactive,$VILA_SLURM_PARTITION -t 4:00:00 \
    -J dev:docker-group-ci \
    --gpus-per-node 8 --exclusive \
    --no-container-remap-root --no-container-mount-home \
    --container-image lyken/test-runner \
    --pty bash start.sh

sleep 10
done

while true; do

GITHUB_ACCESS_TOKEN=$ELM_RUNNER_TOKEN \
RUNNER_ORGANIZATION_URL=https://github.com/Efficient-Large-Model \
RUNNER_TAGS="self-hosted,linux,x64,gpu" \
RUNNER_NAME="ligeng-cs-gpu" \
RUNNER_TAGS=${RUNNER_TAGS:-"self-hosted,linux,x64,gpu,docker,a100"} \
    srun -A $VILA_SLURM_ACCOUNT -p interactive,$VILA_SLURM_PARTITION -t 4:00:00 \
    -J dev:docker-group-ci \
    --gres=gpu:1 --cpus-per-task 16 --mem=256G \
    --no-container-remap-root --no-container-mount-home \
    --container-image lyken/test-runner \
    --pty bash start.sh

sleep 10
done


VILA_SLURM_PARTITION=interactive,$VILA_SLURM_PARTITION eai-run --pty bash