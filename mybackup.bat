:: Turn off the command prompt.
@ECHO OFF
:: Create the directory C:\mybackups
MKDIR C:\mybackups
:: Create the text file mybackupfile.txt
ECHO This will create the file and fill with text. > C:\mybackups\mybackupfile.txt
:: Create the directory C:\mybackupstemp
MKDIR C:\mybackupstemp
:: Create the directory C:\mydocs
MKDIR C:\mydocs
:: Create the two files myfile.txt and myotherfile.txt in C:\mydocs\
ECHO myfile.txt > C:\mydocs\myfile.txt
ECHO myotherfile.txt > C:\mydocs\myotherfile.txt
:: Create the directory to hold the batch file.
MKDIR C:\mybatchfile
:: Create a batch to carry out commands.
ECHO REM Move all contents of C:\mybackups to C:\mybackupstemp > C:\mybatchfile\mybackup.bat
ECHO MOVE C:\mybackups\*.* C:\mybackupstemp\*.* /Y >> C:\mybatchfile\mybackup.bat
ECHO REM Copy all files from C:\mydocs to C:\bybackupstemp >> C:\mybatchfile\mybackup.bat
ECHO COPY C:\mydocs\*.* C:\bybackupstemp\*.* /C/Y >> C:\mybatchfile\mybackup.bat
ECHO REM Delete the folder C:\mybackupstemp and all it's contents >> C:\mybatchfile\mybackup.bat
ECHO RMDIR C:\mybackupstemp /S/Q >> C:\mybatchfile\mybackup.bat
ECHO REM Run chkdsk on C: >> C:\mybatchfile\mybackup.bat
ECHO CHKDSK C: /R/X >> C:\mybatchfile\mybackup.bat
ECHO REM Restart the computer. >> C:\mybatchfile\mybackup.bat
ECHO SHUTDOWN /R >> C:\mybatchfile\mybackup.bat
:: Now we will test the newly created batch file, dependent on user choice.
:runBatchFile?
SET /P userAnswer=Would you like to test/run mybackup.bat (y/n)?
IF %userAnswer%==y (
C:mybatchfile\mybackup.bat
) ELSE IF %userAnswer%==Y (
C:mybatchfile\mybackup.bat
) ELSE IF %userAnswer%==n (
SET /P userExit=All finished, press any key to exit.
EXIT
) ELSE IF %userAnswer%==N (
SET /P userExit=All finished, press any key to exit.
EXIT
) ELSE (
ECHO.
ECHO Please answer y for yes or n for no.
GOTO :runBatchFile?
)
