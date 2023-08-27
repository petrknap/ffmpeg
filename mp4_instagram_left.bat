set dir=%~dp0
set file=%~1

call %dir%\priority_low.bat ffmpeg

%dir%\ffmpeg.exe -i "%file%" -vf "[in] scale=w=1080:h=1080:force_original_aspect_ratio=increase [scale]; [scale] crop=1080:1080:0:0 [out]" "%file%_instagram_left.mp4"

call %dir%\mp4_watermark.bat "%file%_instagram_left.mp4" "%dir%\mp4_instagram_watermark.png"
