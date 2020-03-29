@echo off

REM Requirements:
REM 1) docker needs to be installed: https://docs.docker.com/docker-for-windows/install/
REM 2) Needs be be run from your NWN-Dark-Sun branch

REM Nasher info: https://github.com/squattingmonk/nasher.nim

REM Common commands:

REM pack
REM unpack
REM compile

REM config --list
REM config installDir C:\NWN 


if "%1" == "" (
	set COMMAND=pack
) else (
	set COMMAND=%*
)

echo ------------------------------------
echo Running: nasher %COMMAND%
echo ------------------------------------


docker run --rm -it -v "%cd%:/nasher" squattingmonk/nasher:latest %COMMAND%



REM pause