#!/bin/bash
######################################################################################################
# PostgreSQL Security Assessment Script
# Nimrodzw@gmail.com
# Description: This script collects PostgreSQL security-related information and writes it to an
# output file for further review.
#
# Requirements:
#   - Must be run on a Linux server hosting PostgreSQL.
#   - Execute as the 'postgres' user.
#   - PostgreSQL client (psql) must be installed.
#
# Steps:
#   1. Log into the Linux server hosting the PostgreSQL database with an admin account.
#   2. Switch to the postgres user:
#         su - postgres
#   3. Ensure this script is executable:
#         chmod +x postgres-assessment.sh
#   4. Run the script:
#         ./postgres-assessment.sh
#
# Once executed, the script generates the file:
#   AuditOutput/PostgreSQL-Output.txt
#
# Please review the generated file and send it back for analysis.
#
# GitHub: https://github.com/nimrodzw
######################################################################################################

# Enable strict error handling
set -euo pipefail

# Configuration
DATABASE="template1"
OUTPUT_DIR="AuditOutput"
OUTPUT_FILE="${OUTPUT_DIR}/EY-ZW-PostgreSQL-Output.txt"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Function to execute psql command and append output with a separator
run_psql() {
    local query="$1"
    psql -d "$DATABASE" -c "$query" >> "$OUTPUT_FILE"
    echo '*********************************************************************' >> "$OUTPUT_FILE"
}

# Clear previous output if it exists
> "$OUTPUT_FILE"

echo "Collecting PostgreSQL security assessment information..."

# Retrieve PostgreSQL version
psql -d "$DATABASE" -c 'SELECT VERSION()' > "$OUTPUT_FILE"
echo '*********************************************************************' >> "$OUTPUT_FILE"

# Collect database and role information
run_psql '\l'
run_psql '\du'
run_psql '\dv'
run_psql '\dn+'
run_psql '\dp*'

# Output pg_shadow table contents
echo 'Table pg_shadow:' >> "$OUTPUT_FILE"
psql -d "$DATABASE" -c 'SELECT * FROM pg_shadow' >> "$OUTPUT_FILE"
echo '*********************************************************************' >> "$OUTPUT_FILE"

# Output pg_authid table contents
echo 'Table pg_authid:' >> "$OUTPUT_FILE"
psql -d "$DATABASE" -c 'SELECT * FROM pg_authid' >> "$OUTPUT_FILE"
echo '*********************************************************************' >> "$OUTPUT_FILE"

# Show logging settings
run_psql 'show logging_collector'
run_psql 'show log_directory'
run_psql '\dy'

# Output pg_settings table contents
echo 'Table pg_settings:' >> "$OUTPUT_FILE"
psql -d "$DATABASE" -c 'SELECT * FROM pg_settings' >> "$OUTPUT_FILE"
echo '*********************************************************************' >> "$OUTPUT_FILE"

echo "Assessment complete. The output file is located at: $OUTPUT_FILE"
echo "Please review the file and send it back for further analysis."

exit 0
