generate: 
	@flutter pub run build_runner build

init:
	@flutter pub upgrade

test: generate #info: Run UI tests
	@flutter test
