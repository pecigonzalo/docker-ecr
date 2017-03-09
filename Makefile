default: pre_build build

pre_build: ./amazon-ecr-credential-helper/Dockerfile
	docker build -t gobuilder ./amazon-ecr-credential-helper/
	docker run --rm \
		-e TARGET_GOOS=$(TARGET_GOOS) \
		-e TARGET_GOARCH=$(TARGET_GOARCH) \
		-v "$(PWD)/bin:/go/src/github.com/awslabs/amazon-ecr-credential-helper/bin" \
		gobuilder

build:
	ci/build.sh

deploy:
	ci/check_version.sh
	ci/deploy.sh
