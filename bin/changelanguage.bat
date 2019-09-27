@echo off

rem >> https://niemtin007.blogspot.com
rem >> The batch file is written by niemtin007.
rem >> Thank you for using Multiboot Toolkit.

title %~nx0

:install
cd /d "%bindir%"
    call colortool.bat
cd /d "%ducky%\BOOT"
    for /f "tokens=*" %%b in (lang) do set current=%%b
echo.
echo ^> Current Language is %current%
echo ======================================================================
echo        [ 1 ] = English                [ 2 ] = Vietnam                 
echo        [ 3 ] = Turkish                [ 4 ] = Simplified Chinese      
echo ======================================================================
echo.
set mylang=1
set /P mylang= %_lang0016_% [ ? ] = 
if "%mylang%"=="1" set "lang=English" & goto :continue
if "%mylang%"=="2" set "lang=Vietnam" & goto :continue
if "%mylang%"=="3" set "lang=Turkish" & goto :continue
if "%mylang%"=="4" set "lang=SimplifiedChinese" & goto :continue
color 4f & echo. & echo %_lang0003_% & timeout /t 15 >nul & cls & goto :install

:continue
echo.
echo %_lang0014_%
cd /d "%bindir%"
    7za.exe x "config\%lang%.7z" -o"%ducky%\" -aoa -y > nul
    >"%ducky%\BOOT\lang" (echo %lang%)
    call language.bat
cd /d "%ducky%\BOOT\GRUB\themes\"
    for /f "tokens=*" %%b in (theme) do set "gtheme=%%b"
cd /d "%bindir%\config"
    call "main.bat"
rem > setting language for grub2 file manager
    >"%ducky%\BOOT\grub\lang.sh" (echo export lang=%langfm%;)
call "%bindir%\exit.bat"