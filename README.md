# JMeter Headless Runner

This repository contains a Windows batch script to run a JMeter test plan in headless mode with a timestamped results file and HTML report.

Files

- [jmeter_headless_mode.bat](jmeter_headless_mode.bat)
- [jmeter.log](jmeter.log)
- [README.md](README.md)

## Quick usage

1. Edit the script variables at the top of [jmeter_headless_mode.bat](jmeter_headless_mode.bat) if needed:
   - [`JMETER_HOME`](jmeter_headless_mode.bat) — path to your JMeter installation.
   - [`BASE_RESULTS_DIR`](jmeter_headless_mode.bat) — directory to store .jtl result files.
   - [`BASE_REPORT_DIR`](jmeter_headless_mode.bat) — directory to store generated HTML reports.
2. Save changes and run the script by executing in cmd: `c:\path\to\jmeter_headless_mode.bat c:\path\to\test_plan.jmx`
3. The script generates:

   - [`RESULTS_FILE`](jmeter_headless_mode.bat) — results\_%RUN_ID%.jtl
   - [`REPORT_DIR`](jmeter_headless_mode.bat) — report\_%RUN_ID% HTML folder

## Notes & maintenance

- Keep the test plan (.jmx) up to date inside JMeter GUI. If your test uses an access token (OAuth/JWT/etc.), refresh or update the token inside the test plan before running headless runs (for example, update a CSV/variable or the HTTP Header Manager values).
- To point to a different test plan, provide a new path to the desired .jmx file as an argument to the run command.
- The script relies on PowerShell to generate the timestamp; ensure PowerShell is available in PATH.
- Ensure JMeter plugins, libraries, or test-specific files referenced by the .jmx are present under your JMeter installation.

## Troubleshooting

- If the report generation fails, inspect the .jtl results file and JMeter console output. Check [jmeter.log](jmeter.log) for previous run logs.
- If paths contain spaces, keep the surrounding quotes in the variables as already present in the script.

## License / Disclaimer

- This README describes how to run the included script only. Adjust paths and credentials as required for your environment.
