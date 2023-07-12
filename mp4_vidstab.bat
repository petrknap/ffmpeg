set dir=%~dp0
set file=%~1
set trf_file=%~n1%.trf

call %dir%\priority_low.bat ffmpeg

%dir%\ffmpeg.exe -i "%file%" -vf "[in] vidstabdetect=shakiness=7:result='%trf_file%' [out]" -f null -

call %dir%\priority_low.bat ffmpeg

%dir%\ffmpeg.exe -i "%file%" -vf "[in] vidstabtransform=smoothing=30:zoom=5:input='%trf_file%' [out]" -acodec copy "%file%_vidstab.mp4"

del %trf_file%

call %dir%\mp4_sidebyside.bat "%file%" "%file%_vidstab.mp4" "%file%_vidstab_comparison.mp4"
