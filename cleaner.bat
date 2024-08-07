@echo off
@rem auther: Void Software
echo ----------
echo FiveM Cleaner By Void
echo ----------

set target=%LOCALAPPDATA%\FiveM\FiveM.app\data
set testmode=0
set automode=0
set _day=%date:~0,4%%date:~5,2%%date:~8,2%
set _time2=%time: =0%
set _time=%_time2:~0,2%%_time2:~3,2%%_time2:~6,2%
set _backup=_backup%_day%%_time%

:init
  if %testmode%==1 set target=%~dp0\test
  echo Initialized.....testmode:%testmode% automode:%automode%
  echo gta5Folder is: %target%
  echo backupFolder is: %_backup%
  cd /d %target%

:move
  @rem if exist cache folder, I think all folder is available.
  if exist cache (
    if not exist %_backup% (
      mkdir %_backup%
      echo Created %_backup% folder;
    )
    move ./cache ./%_backup%
    move ./server-cache ./%_backup%
    move ./server-cache-priv ./%_backup%
  ) else (
    echo Not found cache folders
    goto :end
  )

:delBack
  echo Press anyKey to delete %_backup% folder
  if %automode%==0 pause

  if exist %_backup% (
    rd /s /q %_backup%
    echo Deleted %_backup% folder
  ) else (
    echo -----
    echo [Error] Not found %_backup% folder
    echo -----
  )

:end
  echo Press anyKey to finish
  pause

exit
