all: build
update:
	git submodule update --init
	cd brubeck && git submodule update --init

build:
	docker build -t brubeck .

run:
	docker run -it brubeck
