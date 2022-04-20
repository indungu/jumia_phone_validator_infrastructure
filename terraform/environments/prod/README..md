## Provision prod infrastructure

This set of files orchestrates the infrastructure needed for the production environment

### Prerequisites

As a prerequisite we need to create the state store defined in the `backend.tf` file. We do by runnuing the following command (please note you need to have the AWS ClI installed and configured to access your account).

```bash
aws s3 mb s3://jumia-phone-validator
```