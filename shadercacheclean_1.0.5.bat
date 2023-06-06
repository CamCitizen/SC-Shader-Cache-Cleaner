@echo off
rem This is a custom batch script for the Star Citizen Shader Cache folder.

echo Welcome to the Star Citizen Shader Cache Cleaner by CamCitizen!
echo Version 1.0.5
echo.
echo.

rem Display the contents of the Star Citizen Shader Cache folder.
set SC_DIR=%localappdata%\Star Citizen
echo The contents of the Star Citizen Shader Cache folder (%localappdata%\Star Citizen):
dir /b "%SC_DIR%"
echo ------
set SC_FILES=%localappdata%\Star Citizen
@for /f %%a in ('2^>nul dir "%SC_FILES%" /a-d/b/-o/-p/s^|find /v /c ""') do set n=%%a
@echo Total files: %n%!
echo.

echo Do you want to delete all files within the Star Citizen Shader Cache folder?
choice /C YN /M "Please enter your choice:"
if %errorlevel% equ 1 (
    rem Count the number of files before deletion.
    for /f %%A in ('dir /a-d /b "%SC_DIR%" 2^>nul ^| find /c /v ""') do set NUM_FILES=%%A

    rem Delete all files within the folder.
    del /f /q "%SC_DIR%\*.*"
    
    echo %NUM_FILES% files were deleted successfully.
)

echo.
echo Press any key to close the script.
pause >nul
exit
