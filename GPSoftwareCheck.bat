@echo off

set /a count1=0
set /a count2=0
set /a count3=0
set /a count4=0
set /a count5=0
set /a count6=0



::*************************************FLASH****************************************************************
if exist "\\%1\C$\Program Files (x86)\Adobe\Flash Player\AddIns\airappinstaller\airappinstaller.exe" goto SHOCKWAVE
set flash=FLASH
set /a count1=1

::*************************************SHOCKWAVE*******************************************************
:SHOCKWAVE
if exist "\\%1\C$\Windows\SysWOW64\Adobe\Shockwave 12\SwInit.exe" goto AIR
set shockwave=SHOCKWAVE
set /a count2=1

::*************************************AIR******************************************************************
:AIR
if exist "\\%1\C$\Program Files (x86)\Common Files\Adobe AIR" goto READER
set air=AIR
set /a count3=1

::*************************************READER***********************************************************
:READER
if exist "\\%1\C$\Program Files (x86)\Adobe\Reader 11.0\Reader\AcroRd32.exe" goto SMART
set reader=READER
set /a count4=1

::*************************************SMART*********************************************************
:SMART
if exist "\\%1\C$\Program Files (x86)\SMART Technologies\Education Software\SMARTBoardTools.exe" goto JAVA
set smart=SMART
set /a count5=1

::*************************************JAVA**********************************************************
:JAVA
if exist "\\%1\C$\Program Files (x86)\Java\jre7\README.txt" goto DONIZZLE
set java=JAVA
set /a count6=1

:DONIZZLE

set /a total=count1+count2+count3+count4+count5+count6

if %total% EQU 0 goto leave
if %total% EQU 6 goto communi

echo %1, %flash%, %shockwave%, %air%, %reader%, %smart%, %java% >> "\\ServerName\Logs\GP_Result".csv
echo call GP_Check.bat %1 >> "\\ServerName\Logs\GP_Check_New".bat
goto leave

:communi
echo %1, Could Not Communicate With Station >> "\\ServerName\Logs\GP_Result".csv
echo call GP_Check.bat %1 >> "\\ServerName\Logs\GP_Check_New".bat

:leave