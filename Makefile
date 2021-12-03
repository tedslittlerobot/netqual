
xcode:
	rm -rf netqual.xcodeproj
	@sleep 1
	swift package generate-xcodeproj
	xed netqual.xcodeproj

build:
	mkdir build
	swift build
	cp .build/debug/netqual build/netqual

clean:
	rm -rf build

hardClean: clean
	rm -rf .build
