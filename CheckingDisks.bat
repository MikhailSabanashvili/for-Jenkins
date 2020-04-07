@echo off
echo.>%0.txt
setlocal enableextensions enabledelayedexpansion
set err=100
 
for /f "skip=1 tokens=1-3" %%i in ('2^>nul ^
WMIC LogicalDisk ^
WHERE "DriveType='3'" ^
GET FreeSpace^, Name^, Size^') do (
 
  set sFreeSize=%%i
  set sFreeSizeOf=%%k
 if NOT 1%%j==1 (
    rem echo %%j %%i %%k
    set /A Free=!sFreeSize:~0,-9!
    set /A Size=!sFreeSizeOf:~0,-9!
    set /A Procent=!Free!*100/!Size!
    set ah= 
    if !Procent! LSS 50 (
      set ah=***ACHTUNG*** 
      if !Procent! LSS !err! set err=!Procent!
    )
    echo !ah!Free space %%j: !Procent!%%. Free !Free! Gb of !Size! Gb >>%0.txt
  )
 
)
type %0.txt
pause
exit /b !err!
endlocal