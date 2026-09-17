@echo off
setlocal EnableExtensions DisableDelayedExpansion
rem Save this file in the 350w project directory.
pushd "%~dp0"
if errorlevel 1 exit /b 1

where hugo >nul 2>&1
if errorlevel 1 (
    echo ERROR: Hugo was not found on PATH.
    goto failed
)
rem Locate Windows PowerShell even when its folder is missing from PATH.
set "psExe=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"
if exist "%psExe%" goto powershell_found
set "psExe="
for %%P in (pwsh.exe powershell.exe) do if not defined psExe for %%Q in (%%~$PATH:P) do set "psExe=%%Q"
if not defined psExe (
    echo ERROR: PowerShell could not be found in Windows or on PATH.
    goto failed
)
:powershell_found

rem Open the browser independently so Hugo can start immediately.
start "" /b "%psExe%" -NoLogo -NoProfile -NonInteractive -Command "Start-Sleep -Seconds 2; Start-Process 'http://localhost:1313'"
echo Starting Hugo. Press Ctrl+C to stop the server.
hugo server
set "result=%errorlevel%"
popd
endlocal & exit /b %result%

:failed
popd
pause
endlocal & exit /b 1
