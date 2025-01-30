# Data Lake with ETL on AWS

This project sets up a Data Lake with ETL on AWS using Terraform.

## Architecture

1. **S3 Bucket**: Stores raw data.
2. **EventBridge**: Triggers an event when a file named "data_dump" is dropped in the S3 bucket.
3. **Lambda Function**: Initiates the ETL job.
4. **AWS Glue**: Performs ETL operations on the raw data.
5. **RDS**: Stores the processed data.
6. **SNS**: Notifies stakeholders about the data processing status.

## Usage

To run this project, make sure you are in the folder and use the following commands:

1. **Copy AWS credentials**: Copy and paste the AWS credentials in the credentials file (~/.aws/credentials).

```sh
[profile_name]
aws_access_key_id=xxx
aws_secret_access_key=yyy
aws_session_token=zzz
```

2. **Update The Profile Name**: In the desired environment directory (dev, staging, or prod) change the string for the variable `aws_profile` in the file `terraform.tfvars` to match the `profile_name`.

```sh
cd environments/<selected_stage>
terraform init
```

2. **Initialize Terraform**: Navigate to the desired environment directory (dev, staging, or prod) and initialize Terraform.

```sh
cd environments/<selected_stage>
terraform init
```

3. **Apply Terraform Configuration**: Apply the Terraform configuration to set up the infrastructure.

```sh
terraform apply
```

4. **Cleanup**: To destroy the infrastructure when no longer needed, run.

```sh
terraform destroy
```
