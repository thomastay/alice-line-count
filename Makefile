pypy: clean alicelc/aliceLC.so
	python3 setup.py bdist_wheel

aliceLC.exe: src/aliceLC.nim
	nim c -d:release -o:aliceLC.exe src/aliceLC.nim

alicelc/aliceLC.so: src/aliceLC.nim
	nim c -d:release -d:danger --app:lib -o:alicelc/aliceLC.so src/aliceLC.nim

sources: clean
	niminst csource src/aliceLC.ini --d:release --app:lib

zipsources: sources
	tar -czvf sources.tar.gz build/

compare: alicelc/aliceLC.so
	echo "### Testing Nim countline ###"
	/usr/bin/time python3 nim_countlines.py bigfile
	echo "### Testing Python countline ###"
	/usr/bin/time python3 python_countlines.py bigfile

clean:
	rm -rf build/ dist/ *.egg-info/ *.tar.gz

fullClean: clean
	rm -rf alicelc/aliceLC.so aliceLC.exe

.PHONY:
	clean pypy fullClean sources zipsources
