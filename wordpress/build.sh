DOCKER_REPO="dangdungcntt/php"
for i in `find . -name "*.Dockerfile" -type f`; do
    TAG_NAME=$(echo ${i} | grep -oE '[a-z0-9\.\-]+\.Dockerfile' | sed 's/\.Dockerfile//')
    IMAGE_NAME="${DOCKER_REPO}:${TAG_NAME}"
    echo "Building ${IMAGE_NAME} with Dockerfile ${i}"
    docker buildx build --platform=linux/amd64,linux/arm64/v8 -t ${IMAGE_NAME} -f ${i} --push .
done