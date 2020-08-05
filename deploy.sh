REGISTRY_URL="${AWS_ACCOUNT}.ecr.${AWS_REGION}.amazonaws.com"
SOURCE_IMAGE="myapp"
TARGET_IMAGE="${REGISTRY_URL}/myapp"
TARGET_IMAGE_LATEST="${TARGET_IMAGE}:latest"
TIMESTAMP=$(date '+%Y%m%d%H%M%S')
VERSION="${TIMESTAMP}-${TRAVIS_COMMIT}"
TARGET_IMAGE_VERSIONED="${TARGET_IMAGE}:${VERSION}"

aws configure set default.region ${AWS_REGION}

$(aws ecr get-login --no-include-email)

docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE_LATEST}
docker push ${TARGET_IMAGE_LATEST}

docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE_VERSIONED}
docker push ${TARGET_IMAGE_VERSIONED}
