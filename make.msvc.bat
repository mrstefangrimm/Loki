@ECHO OFF

if defined LOKI_TMP (
	goto STARTCOMPILING
)

:: Viual C++ 2022 (17)

if exist "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\vsdevcmd\ext\vcvars.bat" (
	echo -
	echo - Visual C++ 2022 found.
	echo -
	call "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\vsdevcmd\ext\vcvars.bat"
	set LOKI_TMP=true
	goto STARTCOMPILING
)


echo -
echo - No Visual C++ 2022 found, please update this batch file. 
echo - 
echo - expected path for vcvars.bat is:
echo - 
echo - C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\vsdevcmd\ext
echo -

goto ERROR
		


:STARTCOMPILING


:: buid process

if defined LOKI_TMP (


@ECHO ON

cd src
call make.msvc.bat
call make.msvc.dll.bat
cd ..

cd test
call make.msvc.bat
cd ..

goto LEAVE

)

:ERROR
echo -
echo -
echo - An error occured. Compiling aborted.
echo - 
pause



:LEAVE

