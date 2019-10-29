all: build

build:
	git submodule update --init
	cd brubeck && git submodule update --init
	docker build -t brubeck .
run:
	docker run -it brubeck
