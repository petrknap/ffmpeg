set dir=%~dp0
set file=%~1
set watermark=%~2

call %dir%\priority_low.bat ffmpeg

%dir%\ffmpeg.exe -i "%file%" -i %watermark% -filter_complex "overlay=0:0" "%file%_watermark.mp4"
