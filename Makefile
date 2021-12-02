
xcode:
	rm -rf netqual.xcodeproj
	@sleep 1
	swift package generate-xcodeproj
	xed netqual.xcodeproj

build:
	swift build
