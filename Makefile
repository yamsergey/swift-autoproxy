help:
	@echo "The following make targets are available:"
	@echo "	 test	run all tests with coverage"
	@echo "  build  "
	@echo "  build-all build sources and tests"
	@echo "  clean  clean the project"
	@echo "  linux-test-gen will generate files needed to run tests on Linux, works only on Mac OS"	
	@echo "  xcode generate xcode project"
	@echo "  docker-build build docker image"
	@echo "  docker-push image to registry"

test:
	swift test

build:
	swift build

build-all:
	swift build --build-tests

clean:
	swift package --clean 

linux-test-gen:
	swift test --generate-linuxmain

xcode:
	swift package generate-xcodeproj 

docker-build:
	docker build -t yamsergey/swift-autoproxy-primary-build:$(VERSION) .circleci/images/

docker-push:
	docker push yamsergey/swift-autoproxy-primary-build:$(VERSION)
