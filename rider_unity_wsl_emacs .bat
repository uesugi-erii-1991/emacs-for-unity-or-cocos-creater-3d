@echo off
@REM 有错误,仅供参考
set file_path="%4" 
rem 找到Assets目录的前一层目录
echo %file_path%
set file_name=""

for %%a in ("%file_path:\=" "%") do (
    if "%%a" == ""Assets"" (
        echo %%a "true" %file_name%
        @REM set file_name=%%b
        @REM pause
        goto for_end 
    ) else (

        echo %%a "false" %file_name%
        echo %%a
        set file_name=%%a
        @REM pause
    )
    set file_name=%%a
    @REM echo "%file_name%" %file_name%
@REM   set  "file_name=%a%"
    
)

:for_end

echo %file_name%   ---11
echo %3
set line_num=+%3
if "%3"=="-1" (echo %3 ss00s) else (echo %3 ff2f)
if "%3"=="-1" (set line_num=+1) else (set line_num=+%3)
if "%3" == "-1" (echo %3 ss00s) else (echo %3 ff2f)

echo %line_num%  

set server_name=%file_name%
set "server_name=%server_name:"=%"


@REM set EMACS_SERVER_FILE=/mnt/wslg/runtime-dir/emacs/%server_name%
@REM /root/.emacs.d/
rem 检测 Emacs server 是否正在运行
@REM call wsl /root/.nix-profile/bin/emacsclient --server-file %EMACS_SERVER_FILE% --eval "(+ 2 2)"

@REM 此段可想方法完善 现在有错误 

@REM call wsl /root/.nix-profile/bin/emacsclient --server-file /root/.emacs.d/server/%server_name% --eval "(+ 2 2)"
@REM if %errorlevel% neq 0 (
@REM     rem 如果Emacs server未运行，则启动之
@REM     @REM call wsl emacs -nw --daemon=%server_name% 
@REM     call wsl /root/.nix-profile/bin/emacs --daemon=%server_name% 
@REM     @REM --with-x-toolkit=lucid
@REM )

rem Convert Windows file path to WSL file path
@REM wsl wslpath  %file_path%
echo 000
echo a1 "%file_path%"
set "file_path=%file_path:"=%"
echo "a2 %file_path%"
echo %wslpath%
echo 1111
@REM for /f "delims=" %%i in ('wslpath "%file_path%"') do set wsl_file_path=%%i
echo ---
echo %server_name% -n %line_num% %wslpath%  
echo %server_name% -n %line_num% %file_path%  
@REM echo --server-file /mnt/wslg/runtime-dir/emacs/%server_name% -n %line_num% %file_path% 
echo ====


set "wslpath=%wslpath:"=%"
rem Convert Windows file path to WSL file path
wsl wslpath  "%file_path%"
echo wsl wslpath %wslpaht% 00000  %file_path%
for /f "delims=" %%i in ('wslpath "%file_path%"') do set wsl_file_path=%%i
echo -------
echo %server_name% -n %line_num% %file_path% 
rem 使用 emacsclient 打开文件
@REM call wsl /root/.nix-profile/bin/emacsclient  --server-file %EMACS_SERVER_FILE% -n %line_num% %file_path% 
@REM call wsl /root/.nix-profile/bin/emacsclient  --server-file /root/.emacs.d/server/%server_name% -n %line_num% %file_path% 
@REM call wsl /home/hy/.nix-profile/bin/emacsclient  --socket-name %server_name% -n %line_num% %file_path% 
@REM call wsl /home/hy/.nix-profile/bin/emacsclient  --socket-name %server_name% -n %line_num% %wsl_file_path% 
call wsl /home/hy/.nix-profile/bin/emacsclient  --socket-name %server_name% -n %line_num% %file_path% 
@REM call wsl /root/.nix-profile/bin/emacsclient  -s %server_name% -n %line_num% %file_path%   
@REM call wsl /root/.nix-profile/bin/emacs %file_path%  
pause