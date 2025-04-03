# PostgreSQL Security Assessment Script

## Description

This script is designed to collect essential security-related information from a PostgreSQL database. It retrieves key details such as the PostgreSQL version, database listings, role definitions, schema details, and various system settings. The output is saved to a file for review and further analysis. This tool is ideal for administrators and security professionals looking to audit their PostgreSQL configurations.

## Features

- **Version Check:** Retrieves the PostgreSQL version.
- **Database Information:** Lists all databases and roles.
- **Schema Details:** Shows views and schema-specific data.
- **Security Tables:** Outputs contents of `pg_shadow` and `pg_authid` tables.
- **Logging Settings:** Displays current logging configurations.
- **System Settings:** Collects comprehensive settings from the `pg_settings` table.

## Requirements

- **Environment:** A Linux server hosting a PostgreSQL database.
- **User:** The script must be executed as the `postgres` user.
- **Tools:** PostgreSQL client (`psql`) must be installed and properly configured.

## Setup and Usage

1. **Login to Your Server:**  
   Log in with an admin account on the Linux server hosting your PostgreSQL database.

2. **Switch to the Postgres User:**  
   ```bash
   su - postgres


## Download the Script:
Clone this repository or download the postgres-assessment.sh script.

## Make the Script Executable:
   ```bash
   chmod +x postgres-assessment.sh


## Run the Script:
    ```bash
    sudo ./postgres-assessment.sh

## The script will generate an output file at:
AuditOutput/PostgreSQL-Output.txt

## Review and Share the Output:
After execution, review the output file and send it back if necessary for further analysis or auditing.

## Contributing
Contributions are welcome! Feel free to fork this repository, make improvements, and submit pull requests.

## License
This project is licensed under the MIT License.

## Contact
For any issues or suggestions, please open an issue on GitHub or contact me via GitHub.
