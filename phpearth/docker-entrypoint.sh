#!/bin/sh

set -e

# Function to read Docker secret file and set environment variable
read_secret() {
    local secret_file=$1
    local secret_name=${secret_file##*/}
    local env_var_name=$(echo "$secret_name" | tr '[:lower:]' '[:upper:]')

    if [ -f "$secret_file" ]; then
        export "$env_var_name"=$(cat "$secret_file")
        echo "Loaded secret $secret_name into $env_var_name"
    fi
}

# Loop through all secret files in the /run/secrets directory
for secret_file in /run/secrets/*; do
    read_secret "$secret_file"
done

# Run the main command
exec "$@"
