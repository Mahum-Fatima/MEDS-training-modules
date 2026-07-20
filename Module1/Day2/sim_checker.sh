#!/bin/bash
#Usage: ./sim_checker.sh <logfile>

if [$# -ne 1]; then
   echo "Usage: ./$0 <logfile>"
   exit 1
fi

LOG="$1"

if [! -f "$LOG"]; then
   echo "Log file not found."
   exit 1
fi

ERRORS=$(grep -c "ERROR" "$LOG")
WARNINGS=$(grep -c "WARNING" "$LOG")
PASSED=$(grep -c "PASS" "$LOG")

echo "Errors: $ERRORS"
echo "Warnings: $WARNINGS"
echo "Passed tests: $PASSED"