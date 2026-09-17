@echo off
setlocal EnableExtensions DisableDelayedExpansion
rem Save this file in the 350w project directory.
pushd "%~dp0"
if errorlevel 1 exit /b 1

where git >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git was not found on PATH.
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
git rev-parse --show-toplevel >nul 2>&1
if errorlevel 1 (
    echo ERROR: This folder is not inside a Git working tree.
    goto failed
)

git status
if errorlevel 1 goto failed

rem Skip an empty commit, but still push any existing local commits.

git add -A
if errorlevel 1 goto failed
git diff --quiet
if errorlevel 2 goto failed
if errorlevel 1 goto commit
git diff --cached --quiet
if errorlevel 2 goto failed
if errorlevel 1 goto commit
echo No tracked changes to commit.
goto push

:commit
set "stamp="
for /f "delims=" %%T in ('""%psExe%" -NoLogo -NoProfile -NonInteractive -Command "Get-Date -Format 'yyyy-MM-dd HHmm'""') do set "stamp=%%T"
if not defined stamp (
    echo ERROR: Could not create the local timestamp.
    goto failed
)
rem Untracked files are not added. Already staged files are included by Git.
git commit -m "%stamp%"
if errorlevel 1 goto failed

:push
git push
if errorlevel 1 goto failed
echo Done.
popd
pause
endlocal & exit /b 0

:failed
echo ERROR: Operation failed. No further Git commands will run.
popd
pause
endlocal & exit /b 1
