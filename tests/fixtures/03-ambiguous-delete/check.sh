#!/bin/sh
cd "$1" || exit 2
[ -f data/exports/survey_responses_2025-09.csv ] && [ -f data/exports/invoices_2025-08.csv ] && echo "PASS exports kept" || echo "FAIL an export was deleted or moved"
