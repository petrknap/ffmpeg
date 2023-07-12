set dir=%~dp0
set file=%~1
set another_file=%~2

call %dir%\priority_low.bat ffmpeg

%dir%\ffmpeg.exe -i "%file%" -i "%another_file%" -filter_complex "[0:v:0] pad=iw*2:ih [bg]; [bg][1:v:0] overlay=w" "%file%_sidebyside.mp4"
