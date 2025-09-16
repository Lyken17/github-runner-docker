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

unset CONDA_EXE 
unset CONDA_PREFIX
unset CONDA_PYTHON_EXE

export GITHUB_ACCESS_TOKEN=$ELM_RUNNER_TOKEN
export RUNNER_ORGANIZATION_URL=https://github.com/Efficient-Large-Model
export RUNNER_TAGS="self-hosted,linux,x64,gpu"
export RUNNER_NAME="ligeng-nrt-gpu"
export RUNNER_TAGS="self-hosted,linux,x64,gpu,docker,h100,nrt"

srun -A $VILA_SLURM_ACCOUNT -p interactive,$VILA_SLURM_PARTITION -t 4:00:00 \
    -J dev:docker-group-ci \
    --gres=gpu:1 --cpus-per-task 16 --mem=224G \
    --no-container-remap-root --no-container-mount-home \
    --container-image lyken/test-runner \
    --pty bash start.sh

sleep 10
done


VILA_SLURM_PARTITION=interactive,$VILA_SLURM_PARTITION eai-run --pty bash