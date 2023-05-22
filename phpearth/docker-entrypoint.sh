#!/bin/sh

set -e

secret_folder=${SECRET_FOLDER:-"/run/secrets"}
# Function to read Docker secret file and set environment variable
read_secret() {
    local secret_file=$1
    local secret_name=${secret_file##*/}
    local default_var_name=$(echo "$secret_name" | tr '[:lower:]' '[:upper:]')
    local env_var_name=${2:-$default_var_name}

    if [ -f "$secret_file" ]; then
        export "$env_var_name"=$(cat "$secret_file")
    fi
}

# Function to read environment variables mapping to secret names
mapDockerSecrets() {
    if [ -z "$MAP_DOCKER_SECRETS" ]; then
        return
    fi

    IFS=','

    for env_var_name in $MAP_DOCKER_SECRETS; do
        local lower_var_name=$(echo "$env_var_name" | tr '[:upper:]' '[:lower:]')

        if [ -f "$secret_folder/$lower_var_name" ]; then
            continue
        fi

        local secret_name=$(eval "echo \$$env_var_name")

        if [ -n "$secret_name" ]; then
            secret_file="$secret_folder/$secret_name"

            if [ -f "$secret_file" ]; then
                read_secret "$secret_file" "$env_var_name"
            else
                echo "Secret file $secret_file not found!"
                exit 1
            fi
        else
            echo "No secret name '$secret_name' found for to map into variable $env_var_name"
            exit 1
        fi
    done
}

for secret_file in $secret_folder/*; do
    read_secret "$secret_file"
done

mapDockerSecrets

# Run the main command
exec "$@"
