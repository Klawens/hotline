#!/bin/bash

while true; do
    gpu_processes=$(nvidia-smi --query-compute-apps=pid --format=csv,noheader,nounits)

    echo "GPU Processes: $gpu_processes"

    # Check if GPU has no active processes
    if [[ -z "$gpu_processes" ]]; then
        echo "No active processes on GPU. Executing your command..."
        # Replace the following line with your command
        python train.py
        break  # Break the loop after executing your command
    fi

    # Wait for some time before checking again (adjust as needed)
    sleep 2  # Check every 2 seconds
    clear   # Clear the screen for displaying real-time stats
done

