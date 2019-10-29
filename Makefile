all: build

build:
	cd brubeck && git submodule init && git submodule update
	docker build -t brubeck .
run:
	docker run -it brubeck
