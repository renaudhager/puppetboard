NAME = renaudhager/puppetboard
VERSION = v1.0.0

GIT_TAG := $(shell git describe --abbrev=0 --tags --exact-match)

prerun:
	$(call check_defined, GIT_TAG)


all: build push

build: prerun
	docker build --tag="$(NAME):$(GIT_TAG)" --rm .


push: prerun
	docker push "$(NAME):$(GIT_TAG)"
