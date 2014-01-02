PREFIX := .

DOCKER := docker
IMAGE_NAME := sbisbee/couchdb

all: 1.3 1.4 1.5

1.3:
	ln -s couchdb13.Dockerfile Dockerfile
	${DOCKER} build -t ${IMAGE_NAME}:1.3 .
	rm Dockerfile

1.4:
	ln -s couchdb14.Dockerfile Dockerfile
	${DOCKER} build -t ${IMAGE_NAME}:1.4 .
	rm Dockerfile

1.5:
	ln -s couchdb15.Dockerfile Dockerfile
	${DOCKER} build -t ${IMAGE_NAME}:1.5 .
	rm Dockerfile

clean:
	rm Dockerfile
