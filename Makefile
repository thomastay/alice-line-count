pypy: aliceLC.exe
	python3 setup.py bdist_wheel

aliceLC.exe: src/aliceLC.nim
	nim c -d:release -d:danger --app:lib -o:alicelc/aliceLC.so src/aliceLC.nim
	nim c -d:release -o:aliceLC.exe src/aliceLC.nim

c_files: clean
	nim c -d:release --compileOnly --app:lib --nimcache:c_files/ src/aliceLC.nim

allsource:
	niminst csource src/aliceLC.ini --d:release

allzipsources:
	rm -r build/
	niminst csource src/aliceLC.ini --d:release
	tar -czvf sources.tar.gz build/


clean:
	rm -rf build/ dist/ *.egg-info/ c_files/

fullClean: clean
	rm -rf alicelc/aliceLC.so aliceLC.exe

.PHONY:
	clean pypy fullClean c_files
