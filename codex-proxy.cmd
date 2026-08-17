@echo off
setlocal

set "HTTP_PROXY=http://127.0.0.1:7897"
set "HTTPS_PROXY=http://127.0.0.1:7897"
set "NO_PROXY=localhost,127.0.0.1,::1"
set "ALL_PROXY="

rem Resolve the current Microsoft Store package location automatically.
set "CODEX_EXE="
for /f "usebackq delims=" %%I in (`powershell.exe -NoProfile -Command "$pkg = Get-AppxPackage -Name 'OpenAI.Codex' | Sort-Object Version -Descending | Select-Object -First 1; if ($pkg) { Join-Path $pkg.InstallLocation 'app\ChatGPT.exe' }"`) do set "CODEX_EXE=%%I"

if not defined CODEX_EXE (
    echo Codex package OpenAI.Codex was not found.
    echo Please reinstall or update Codex from Microsoft Store.
    pause
    exit /b 1
)

if not exist "%CODEX_EXE%" (
    echo Codex executable was not found:
    echo %CODEX_EXE%
    pause
    exit /b 1
)

start "" "%CODEX_EXE%"
endlocal
