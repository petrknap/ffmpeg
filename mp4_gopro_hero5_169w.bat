set dir=%~dp0
set file=%~1

call %dir%\priority_low.bat ffmpeg

%dir%\ffmpeg.exe -i "%file%" -vf "[in] v360=input=sg:iv_fov=69.5:ih_fov=118.2:d_fov=133.6:output=flat:w=3200:h=1800 [defished]; [defished] crop=w=2520:h=1080 [out]" -acodec copy "%file%_gopro_hero5_169w.mp4"
