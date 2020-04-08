@echo off
for /f "tokens=3" %%a in ('dir c:\') do (
    set bytesfree_c=%%a
)
for /f "tokens=3" %%a in ('dir e:\') do (
    set bytesfree_e=%%a
)
echo %bytesfree_c%>C:\file.txt 
set /p perem=<C:\file.txt
set perem1=%perem:ÿ=%
set perem2=%perem1:~0,-10%
set/a perem3=%perem2%
if %perem3% lss 100 (echo warning, disk C have %perem3% gb of free place) else (echo disk C have %perem3% gb of free place)
echo %bytesfree_e%>C:\file.txt 
set /p pereme=<C:\file.txt
set perem1e=%pereme:ÿ=%
set perem2e=%perem1e:~0,-10%
set/a perem3e=%perem2e%
if %perem3e% lss 100 (echo warning, disk E have %perem3e% gb of free place) else (echo disk E have %perem3e% gb of free place)
pause