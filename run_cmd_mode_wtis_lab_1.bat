@echo off
REM --- Абсолютные пути для вашей установки ---
set OMNETPP_BIN=D:\omnetpp-6.5.0\bin
set INET_DIR=D:\omnetpp-6.5.0\samples\inet-4.7.0
set ProjectPath=%INET_DIR%\examples\labs_wtis\lab1

REM --- Настройка путей для INET ---
set LibPath=%INET_DIR%\src\INET
set NedPath=%INET_DIR%\src;%INET_DIR%\examples;%INET_DIR%\tutorials;%INET_DIR%\showcases
set NedPackage=inet.emulation;inet.showcases.visualizer.osg;inet.showcases.emulation;inet.clock.common;inet.clock.model;inet.visualizer.osg;inet.examples.voipstream;inet.clock.oscillator;inet.examples.emulation;inet.transportlayer.tcp_lwip;inet.applications.voipstream;inet.clock.base;inet.examples.clock;inet.transportlayer.tcp_nsc

REM --- Переход в папку проекта ---
cd /d %ProjectPath%

echo ===================================================
echo Running Aloha_Throughput...
echo ===================================================
"%OMNETPP_BIN%\opp_run.exe" -c Aloha_Throughput -m -u Cmdenv -l "%LibPath%" -n "%NedPath%" -x "%NedPackage%"

echo ===================================================
echo Running CSMA_Throughput...
echo ===================================================
"%OMNETPP_BIN%\opp_run.exe" -c CSMA_Throughput -m -u Cmdenv -l "%LibPath%" -n "%NedPath%" -x "%NedPackage%"

echo.
echo ALL SIMULATIONS COMPLETED!
pause