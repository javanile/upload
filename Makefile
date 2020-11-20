#!make

.PHONY: build
build:
	docker build --tag javanile/upload .

git-push:
	git config credential.helper 'cache --timeout=3600'
	git pull
	git add .
	git commit -am "new release" || true
	git push

docker-push: build git-push
	docker push javanile/upload

lint:
	docker run --rm -i hadolint/hadolint < Dockerfile
	docker run --rm -v ${PWD}/Dockerfile:/Dockerfile replicated/dockerfilelint /Dockerfile

fork:
	curl -sL git.io/fork.sh | bash -

## -----
## Tests
## -----
test:
	bash test.sh
