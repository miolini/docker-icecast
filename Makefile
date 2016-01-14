PWD=$(shell pwd)
NAME_IMAGE=miolini/icecast
NAME_INSTANCE=icecast
build:
	docker build -t $(NAME_IMAGE) .
rebuild:
	docker build --no-cache -t $(NAME_IMAGE) .
run: build
	docker run -v $(PWD)/data:/root -p 0.0.0.0:8000:8000 -d --name icecast -t $(NAME_IMAGE)
	@echo Done.
clean:
	docker rm -f icecast
