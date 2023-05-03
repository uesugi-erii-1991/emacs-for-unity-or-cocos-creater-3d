@echo on
set server_name=unity
call wsl emacs --daemon=%server_name%

pause