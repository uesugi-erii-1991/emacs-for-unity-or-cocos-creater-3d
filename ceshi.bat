setlocal

@REM set EMACS_SERVER_NAME=unity
@REM echo %EMACS_SERVER_NAME% -===


@REM for /f "tokens=1 delims=," %%s in ('emacsclient -a "" -e "(server-list)"') do (
@REM     echo "%%s"------
@REM   if "%%s" == "%EMACS_SERVER_NAME%" (
@REM     echo The %EMACS_SERVER_NAME% server is running.
@REM   ) else (
@REM     echo The %EMACS_SERVER_NAME% server is not running. Starting it now...
@REM     @REM start "" "path/to/emacs.exe" --daemon=%EMACS_SERVER_NAME%
@REM     start "" "emacs.exe" --daemon=%EMACS_SERVER_NAME%
@REM   )
@REM )



set UNITY_SERVER_RUNNING=false

for /f "tokens=2" %%i in ('tasklist /fi "imagename eq emacs*.exe" /nh') do (
  set SERVER_NAME=%%i
  if "!SERVER_NAME!"=="unity" set UNITY_SERVER_RUNNING=true
)

if not %UNITY_SERVER_RUNNING%==true (
  start "" "runemacs.exe" --daemon=unity
)
pause