pypy: aliceLC.exe
	python3 setup.py bdist_wheel

aliceLC.exe: src/aliceLC.nim
	nim c -d:release -d:danger --app:lib -o:alicelc/aliceLC.so src/aliceLC.nim
	nim c -d:release -o:aliceLC.exe src/aliceLC.nim

clean:
	rm -rf build/ dist/ *.egg-info/ 

fullClean: clean
	rm alicelc/aliceLC.so aliceLC.exe

.PHONY:
	clean pypy fullClean
