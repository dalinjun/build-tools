generate: 
	@flutter pub run build_runner build

init:
	@flutter pub get

test: generate #info: Run UI tests
	@flutter test
