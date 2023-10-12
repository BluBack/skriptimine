@Echo Off
set BackupDir=C:\Backup
set CurDate=%DATE:/=-%
 
for /f "tokens=1,2,3 delims=/" %%a in ('date /t') do (
    set CurDate=%%c-%%b-%%a
)
 
for /f "tokens=1-3 delims=/ " %%a in ('echo %date%') do (
    set CurDate=%%c.%%b.%%a
)
 
for /f "tokens=1-3 delims=: " %%a in ('time /t') do (
    set CurTime=%%a.%%b.%%c
)
 
setlocal enableDelayedExpansion
 
for /f "tokens=1-3*" %%a in ('net user') do (
    if "%%b" neq "Administrator" (
        if "%%b" neq "Guest" (
            if "%%c" geq "1001" (
                set Username=%%b
                set FolderName=!Username!-%CurDate%.zip
                set UserFolder= C:\Users\!Username!
                set ZipCommand=7z a -tzip !BackupDir!\!FolderName! "!UserFolder!"
                echo Creating backup for !Username!
                !ZipCommand!
            )
        )
    )
)

echo All backups have been created!
