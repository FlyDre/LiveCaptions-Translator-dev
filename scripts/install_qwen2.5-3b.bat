@echo off
setlocal
chcp 65001 >nul

echo == LiveCaptions Translator Model Installer ==
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0install_qwen2.5-3b.ps1"

if errorlevel 1 (
    echo.
    echo Install failed. Please check the messages above.
    pause
    exit /b 1
)

echo.
echo Install succeeded. You can now start LiveCaptions Translator.
pause
exit /b 0
