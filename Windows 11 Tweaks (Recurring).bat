@echo off
echo -- Recurring Windows 11 tweaks script by fpdevbr --
	powercfg -h off
echo -- Hibernate turned off --
	reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching /v SearchOrderConfig /t REG_DWORD /d 1 /f
echo -- Automatic driver installation enabled --
	Dism /Online /Set-ReservedStorageState /State:Disabled
echo -- Reserve Storage disabled --
@echo on
	SFC /scannow
	Dism /Online /Cleanup-Image /RestoreHealth
	Dism /Online /Cleanup-Image /StartComponentCleanup /ResetBase
@echo off
echo -- System files intregity checked --
	Compact.exe /CompactOS:always
echo -- System files compressed --
echo -- Script finished --
pause