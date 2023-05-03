@echo off
@REM str="F:\_____unity_____project\xxxx\Assets\Scripts\Demo.cs"
 
@REM  @echo off

set file_path="%4" 
rem 找到Assets目录的前一层目录
@REM for %%I in ("%file_path%\..") do set "parent_directory=%%~dpI"
IF EXIST %file_path%\Assets(echo ======)

@REM set "str=........\xxxx\Assets\Scripts\Demo.cs"
@REM set "new_str=%file_path%:~0,%{str:Assets=Assets}%
@REM echo %new_str%
echo %file_path%
@REM rem 找到Assets目录的前一层目录的名字
@REM for %%I in ("%file_path%\..") do set "parent_directory_name=%%~nxI"

for %%I in (%file_path%) do echo %%I -+=
@REM file_path="F:\_____unity_____project\VideoPlayer\Assets\Scripts\VideoPlayerTeach.cs"
@REM ---
set file_neme=""
for %%a in ("%file_path:\=" "%") do (
    @REM if "%%~xa"=="" (
    @REM     echo %%~na is a directory
    @REM ) else (
    @REM     echo %%~na is a file
    @REM )



    file_neme=%a%
    if "%a%" == "Assets" (
        echo %%a "true" %file_neme%
    ) else (
        echo %%a "false" %file_neme%
    )
    


for %%a in ("%file_path:\=" "%") do (
    set file_neme=%%a
    echo %%a | findstr /C:"Assets" >nul && (echo %%a "true" %file_neme%) || (echo %%a "false" %file_neme%)
)

    @REM echo %a%
    @REM  %file_neme% = "%%a"
    @REM if %%a == Assets ( echo %%a "=======")  else ( echo %%a "nnnnn")
    @REM echo %%a "--0--" %file_neme% 
    @REM echo %%~na
    @REM echo 11
)
echo %file_neme%
@REM echo %parent_directory_name% +=rd

@REM echo %parent_directory% ---ddd

@REM set "dir=%~dp4"
@REM set "dir=%dir:Assets\=%"
@REM set "dir=%dir:~0,-1%"
@REM echo %dir% ++==
@REM IF EXIST %file_path%\Assets (
@REM     REM The file path exists in the "Assets" directory
@REM     FOR %%I IN (%file_path%\Assets\..) DO SET parent_dir=%%~nxI
@REM     ECHO %parent_dir%
@REM )
echo -- %4 --
rem Check if %4 exists in Assets folder
set "parent_folder="
for %%I in ("%4\..") do (
    if /i "%%~nxI"=="Assets" (
        set "parent_folder=%%~dpI"
        echo ------------
    )
)

echo Parent folder: %parent_folder%
pause
@REM if %3 == -1(echo %3) else (echo 只)
echo %3
pause
set line_num=+%3
echo %3
if "%3" == "-1" (set line_num=+1) else (set line_num=+%3)
if "%3" == "-1" (echo %3 完成) else (echo %3 wan)

echo %line_num%
@REM set line_num=+%3
set server_name=my_server

rem 检测 Emacs server 是否正在运行
call emacsclient --server-file %server_name% --eval "(+ 2 2)"
if %errorlevel% neq 0 (
    rem 如果Emacs server未运行，则启动之
    call emacs --daemon=%server_name%
)

echo %server_name% -n %line_num%  %file_path%
pause
rem 使用 emacsclient 打开文件
@REM call emacsclient --server-file %server_name% -n %file_path% %line_num%
call emacsclient --server-file %server_name% -n %line_num%  %file_path%  
@REM echo 成功打开文件 %file_path% ，指定行号为：%line_num%
@REM 




@REM @echo off

@REM set file_path=%4 
@REM set line_num=+%3
@REM if "%3" == "-1" (set line_num=+1) else (set line_num=+%3)
@REM set server_name=my_server
@REM rem 检测 Emacs server 是否正在运行
@REM call emacsclient --server-file %server_name% --eval "(+ 2 2)"
@REM if %errorlevel% neq 0 (
@REM     rem 如果Emacs server未运行，则启动之
@REM     call emacs --daemon=%server_name%
@REM )

@REM echo %server_name% -n %line_num%  %file_path%
@REM call emacsclient --server-file %server_name% -n %line_num%  %file_path%  


@REM @echo off
@REM set file_path=%4 
@REM set file_neme=""
@REM for %%a in ("%file_path:\=" "%") do (

@REM     if "%%a"=="Assets" (
@REM         echo %%~na is a directory
@REM     ) else (
@REM         echo %%~na is a file
@REM     )
@REM )


@REM @echo off

@REM set file_path=%4 
@REM echo %file_path%

@REM set file_neme=""
@REM for %%a in ("%file_path:\=" "%") do (
@REM     %file_neme%=%a%
@REM     if "%%a" == "Assets" (
@REM         echo %%a "true" %file_neme%
@REM     ) else (
@REM         echo %%a "false" %file_neme%
@REM     )
@REM )
@REM echo %file_neme%