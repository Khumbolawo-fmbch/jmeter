@echo off
REM ==========================================
REM JMeter Headless Test Runner Script (with Timestamps)
REM ==========================================

REM --- CONFIGURATION ---
set JMETER_HOME=C:\Users\MW50001125\Downloads\apache-jmeter-5.6.3\apache-jmeter-5.6.3\
set TEST_PLAN=C:\Users\MW50001125\Downloads\apache-jmeter-5.6.3\apache-jmeter-5.6.3\bin\test-plans\fx-allocation-system\Re use fx allocation application.jmx
set BASE_RESULTS_DIR=C:\JMeterTests\results
set BASE_REPORT_DIR=C:\JMeterTests\reports

REM --- CREATE TIMESTAMP ---
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set DATESTAMP=%%d-%%b-%%c
)
for /f "tokens=1-2 delims=: " %%a in ("%time%") do (
    set TIMESTAMP=%%a%%b
)

set RUN_ID=%DATESTAMP%_%TIMESTAMP%

REM --- REMOVE INVALID CHARACTERS ---
set RUN_ID=%RUN_ID::=%
set RUN_ID=%RUN_ID:/=%
set RUN_ID=%RUN_ID: =%

REM --- BUILD FILE/FOLDER PATHS ---
set RESULTS_FILE=%BASE_RESULTS_DIR%\results_%RUN_ID%.jtl
set REPORT_DIR=%BASE_REPORT_DIR%\report_%RUN_ID%

echo.
echo ==========================================
echo Starting new JMeter test run
echo Test Plan: %TEST_PLAN%
echo Results File: %RESULTS_FILE%
echo Report Folder: %REPORT_DIR%
echo ==========================================

REM --- CREATE DIRECTORIES IF NOT EXIST ---
if not exist "%BASE_RESULTS_DIR%" mkdir "%BASE_RESULTS_DIR%"
if not exist "%BASE_REPORT_DIR%" mkdir "%BASE_REPORT_DIR%"

REM --- RUN JMETER TEST IN HEADLESS MODE ---
"%JMETER_HOME%\bin\jmeter.bat" -n -t "%TEST_PLAN%" -l "%RESULTS_FILE%" -e -o "%REPORT_DIR%"

echo.
echo ==========================================
echo Test Completed Successfully!
echo Report generated at:
echo %REPORT_DIR%
echo ==========================================
pause
