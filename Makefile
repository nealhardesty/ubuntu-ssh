.DEFAULT_GOAL := build

build:
	docker build -t nealhardesty/ubuntu-ssh:latest -t ubuntu-ssh:latest .

run: build kill
	docker run \
		--name ubuntu-ssh \
		-p 2222:22 \
		--init \
		-e USERNAME=test \
		-e PASSWORD=test \
		ubuntu-ssh:latest

push: build
	docker push nealhardesty/ubuntu-ssh:latest

kill:
	-docker kill ubuntu-ssh
	-docker rm ubuntu-ssh
