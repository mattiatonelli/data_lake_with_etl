# Provisioning and managing a Data Lake with ETL on AWS

This project sets up a Data Lake with ETL on AWS using Terraform, an Infrastructure as code (IaC) tool that enables the safe, predictable and scalable provision and management of infrastructure in any cloud.

## Architecture

1. **S3 Bucket**: Stores raw data.
2. **EventBridge**: Triggers an event when a file named "data_dump" is dropped in the S3 bucket.
3. **Lambda Function**: Performs the preprocessing of the ETL job.
4. **AWS Glue**: Performs the main ETL operations on the raw data.
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

2. **Update user-specific variables**: In the file `terraform.tfvars` in the desired environment directory (dev, staging, or prod) change the string for the variables:

- `aws_account_id` to match your AWS account ID (e.g. 417472128311).
- `aws_profile` to match the `profile_name` you copied from the step before.
- `email` to the desired email address.

3. **Initialize Terraform**: Navigate to the desired environment directory (dev, staging, or prod) and initialize Terraform.

```sh
cd environments/<selected_stage>
terraform init
```

4. **Check Terraform Configuration**: Assess the Terraform configuration corresponding to the desired infrastructure.

```sh
terraform plan
```

5. **Apply Terraform Configuration**: Apply the Terraform configuration to set up the infrastructure.

```sh
terraform apply
```

6. **Cleanup**: To destroy the infrastructure when no longer needed, run.

```sh
terraform destroy
```
