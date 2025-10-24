@echo off
REM ==========================================
REM JMeter Headless Test Runner Script (with Arguments)
REM ==========================================

REM --- CONFIGURATION ---
set JMETER_HOME=C:\Users\MW50001125\Downloads\apache-jmeter-5.6.3\apache-jmeter-5.6.3\
set BASE_RESULTS_DIR=C:\JMeterTests\results
set BASE_REPORT_DIR=C:\JMeterTests\reports

REM --- CHECK FOR ARGUMENT ---
if "%~1"=="" (
    echo Usage: %~nx0 "FullPathToTestPlan.jmx"
    echo Example: %~nx0 "C:\JMeterTests\job_app_test.jmx"
    exit /b 1
)

set "TEST_PLAN=%~1"

REM --- GET A LOCALE-INDEPENDENT TIMESTAMP (dd-MM-yyyy_HHmm) USING POWERSHELL ---
for /f "usebackq delims=" %%I in (`powershell -NoProfile -Command "Get-Date -Format 'dd-MM-yyyy_HHmm'"`) do set "RUN_ID=%%I"

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
