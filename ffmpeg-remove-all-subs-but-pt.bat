md newfiles
for %%a in ("*.mkv") do ffmpeg -i "%%a" -map 0 -map -0:s -map 0:s:m:language:por -c copy "newfiles\%%~na.mkv"
pause