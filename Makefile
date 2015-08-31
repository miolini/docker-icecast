PWD=$(shell pwd)
NAME=miolini/icecast
build:
	docker build -t $(NAME) .
run: build
	docker run -p 80:80 -p 8000:8000 -v $(PWD)/data:/root -t --name $(NAME) $(NAME)
	@echo Done.
clean:
	docker rm -f $(NAME)
