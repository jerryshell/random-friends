@echo off
setlocal enabledelayedexpansion

set "potplayer_path=C:\Program Files\DAUM\PotPlayer\PotPlayerMini64.exe"

set /a file_count=0

for /r %%f in (*.mkv) do (
    set /a file_count+=1
    set "media_files[!file_count!]=%%f"
)

for /r %%f in (*.mp4) do (
    set /a file_count+=1
    set "media_files[!file_count!]=%%f"
)

if %file_count%==0 (
    echo [ERROR] No MKV or MP4 files found in the current directory and its subdirectories.
    pause
    exit /b
)

set /a random_index=%random% %% file_count + 1
set "selected_file=!media_files[%random_index%]!"

echo Selected file: "!selected_file!"

start "" "%potplayer_path%" "!selected_file!"
