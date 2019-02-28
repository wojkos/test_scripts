@echo off
SET testDir="C:\Users\Asus\Desktop\Nowyfolder\test"
SET noMountDir="C:\Users\Asus\Desktop"
if not exist %testDir% mkdir %testDir%

if not exist "%testDir%\test_A" mkdir %testDir%\test_A
for /l %%a in (1 1 50) do fsutil file createnew "%testDir%\test_A\blank_new_file%%a.txt" 1200000
DIR /s/b/a-d "%testDir%\test_A" | find /v /c "::" > tmp
SET /p filesCount= < tmp
del tmp
IF %filesCount% NEQ 50 echo exit

if not exist "%testDir%\test_B" mkdir %testDir%\test_B
for /l %%a in (1 1 200) do fsutil file createnew "%testDir%\test_B\blank_new_file%%a.txt" 120000
DIR /s/b/a-d "%testDir%\test_B" | find /v /c "::" > tmp
SET /p filesCount= < tmp
del tmp
IF %filesCount% NEQ 200 EXIT

@echo on
echo "TEST 1 FINISH"
@echo off

if not exist "%testDir%\test_C" mkdir %testDir%\test_C
xcopy /s %testDir%\test_B %testDir%\test_C
DIR /s/b/a-d "%testDir%\test_C" | find /v /c "::" > tmp
SET /p filesCount= < tmp
del tmp
IF %filesCount% NEQ 200 EXIT

if not exist "%testDir%\test_D" mkdir %testDir%\test_D
if not exist "%noMountDir%\test_X" mkdir %noMountDir%\test_X
for /l %%a in (1 1 70) do fsutil file createnew "%noMountDir%\test_X\blank_new_file%%a.txt" 120000
xcopy /s %noMountDir%\test_X %testDir%\test_D
RMDIR %noMountDir%\test_X /s /q
DIR /s/b/a-d "%testDir%\test_D" | find /v /c "::" > tmp
SET /p filesCount= < tmp
del tmp
IF %filesCount% NEQ 70 EXIT

@echo on
echo "TEST 2 FINISH"
@echo off

if not exist "test_E" mkdir %testDir%\test_E
for /l %%a in (1 1 35) do fsutil file createnew "%testDir%\test_E\blank_new_file%%a.txt" 120000
tar cfvP "%testDir%\Archive.tar" "%testDir%\test_E"
if not exist "test_TAR" mkdir %testDir%\test_TAR
tar xfv "%testDir%\Archive.tar" --directory "%testDir%\test_TAR"
DIR /s/b/a-d "%testDir%\test_E" | find /v /c "::" > tmp
SET /p filesCount= < tmp
del tmp
IF %filesCount% NEQ 35 EXIT

@echo on
echo "TEST 3 FINISH"
@echo off

if not exist "%testDir%\test_F" mkdir %testDir%\test_F
@echo Writing text to dblank.txt> %testDir%\test_F\dblank1.txt
@echo Writing second text to dblank.txt>> %testDir%\test_F\dblank2.txt
@echo Writing third text to dblank.txt>> %testDir%\test_F\dblank3.txt
type %testDir%\test_F\dblank1.txt %testDir%\test_F\dblank2.txt %testDir%\test_F\dblank3.txt > %testDir%\test_F\copied_file.txt
set filename="%testDir%\test_F\copied_file.txt"
type %filename% | find /C /V "" > tmp
SET /p linesCount= < tmp
del tmp
IF %linesCount% NEQ 3 EXIT

@echo on
echo "TEST 4 FINISH"
@echo off

RMDIR %testDir% /s /q
