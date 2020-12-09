DOCKER_REPO="dangdungcntt/php"
for i in `find . -name "Dockerfile" -type f`; do
    TAG_NAME=$(echo ${i} | grep -oE '[a-z0-9\.\-]+\/Dockerfile' | sed 's/\/Dockerfile//')
    IMAGE_NAME="${DOCKER_REPO}:${TAG_NAME}"
    CONTEXT=$(echo ${i} | sed 's/\/Dockerfile//')
    echo "Building ${IMAGE_NAME} with Dockerfile ${i}"
    docker build -t ${IMAGE_NAME} -f ${i} ${CONTEXT}
    docker push ${IMAGE_NAME}
done