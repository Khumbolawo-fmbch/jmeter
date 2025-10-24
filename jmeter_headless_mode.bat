@echo off
REM ==========================================
REM JMeter Headless Test Runner Script
REM ==========================================

REM --- CONFIGURATION ---
set JMETER_HOME=C:\Users\MW50001125\Downloads\apache-jmeter-5.6.3\apache-jmeter-5.6.3\
set TEST_PLAN=C:\Users\MW50001125\Downloads\apache-jmeter-5.6.3\apache-jmeter-5.6.3\bin\test-plans\fx-allocation-system\Re use fx allocation application.jmx
set RESULTS_FILE=C:\JMeterTests\results\results.jtl
set REPORT_DIR=C:\JMeterTests\reports

echo.
echo ==========================================
echo Cleaning up old results...
echo ==========================================

REM --- DELETE OLD RESULTS FILE ---
if exist "%RESULTS_FILE%" (
    del /f /q "%RESULTS_FILE%"
    echo Deleted old results file: %RESULTS_FILE%
) else (
    echo No previous results file found.
)

REM --- DELETE OLD REPORT FOLDER ---
if exist "%REPORT_DIR%" (
    rmdir /s /q "%REPORT_DIR%"
    echo Deleted old report folder: %REPORT_DIR%
) else (
    echo No previous report folder found.
)

echo.
echo ==========================================
echo Starting JMeter test...
echo ==========================================

REM --- RUN JMETER TEST IN HEADLESS MODE ---
"%JMETER_HOME%\bin\jmeter.bat" -n -t "%TEST_PLAN%" -l "%RESULTS_FILE%" -e -o "%REPORT_DIR%"

echo.
echo ==========================================
echo Test Completed.
echo Report generated at: %REPORT_DIR%
echo ==========================================
pause
