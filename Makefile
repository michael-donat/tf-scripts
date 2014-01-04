update:
	git pull
	git submodule foreach git pull
	./bin/updatesubs.sh
