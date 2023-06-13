@echo off
echo -- NTLite Windows 11 tweaks script by fpdevbr --
	reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications /v ConfigureChatAutoInstall /t REG_DWORD /d 0 /f
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Chat" /v ChatIcon /t REG_DWORD /d 3 /f
echo -- Teams autoinstall and chat icon disabled --
	reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching /v SearchOrderConfig /t REG_DWORD /d 0 /f
echo -- Automatic driver installation disabled --
	reg add HKLM\SOFTWARE\Microsoft\.NETFramework /v OnlyUseLatestCLR /t REG_DWORD /d 1 /f
	reg add HKLM\SOFTWARE\Wow6432Node\Microsoft\.NETFramework /v OnlyUseLatestCLR /t REG_DWORD /d 1 /f
echo -- Only use latest CLR (.NET) set to true --
	reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v ShowDriveLettersFirst /t REG_DWORD /d 4 /f
echo -- Show drive letters first enabled --
	reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /t REG_SZ /d C:\Windows\blank.ico /f
echo -- Removed shortcut arrow --
	reg delete HKCR\.zip\CompressedFolder\ShellNew /f
echo -- Removed new compressed folder --
	reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83} /f
echo -- Removed duplicate removable drives --
	reg add HKLM\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc /v Start /t REG_DWORD /d 4 /f
echo -- Disabled WPAD --
	net start w32time
	reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config /v UpdateInterval /t REG_DWORD /d 100 /f
	reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config /v MinPollInterval /t REG_DWORD /d 9 /f
	reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config /v MaxPollInterval /t REG_DWORD /d 13 /f
	w32tm /config /manualpeerlist:"a.st1.ntp.br,0x8 d.st1.ntp.br,0x8" /syncfromflags:manual /update
	sc config w32time start=auto
echo -- w32time updated to better servers --
	netsh dns add encryption 45.90.28.0 https://dns.nextdns.io/*profile*/*id* autoupgrade=yes udpfallback=no
	netsh dns add encryption 45.90.30.0 https://dns.nextdns.io/*profile*/*id* autoupgrade=yes udpfallback=no
	netsh dns add encryption 2a07:a8c0:: https://dns.nextdns.io/*profile*/*id* autoupgrade=yes udpfallback=no
	netsh dns add encryption 2a07:a8c1:: https://dns.nextdns.io/*profile*/*id* autoupgrade=yes udpfallback=no
echo -- NextDNS DoH template added --
echo -- Script finished --
