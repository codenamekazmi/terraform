# A Terraform Module to create an S3 backend in AWS

This remote state file will always contain the latest state deployed to your account and environment, stored within S3. Including DynamoDB brings tracking functionality so that concurrent use of the state file will be blocked or “locked”.

## This will create:
- S3 Bucket
- DynamoDB Table

## To use:

key – The path to the state file inside the bucket. When using a non-default workspace, the state path will be /workspace_key_prefix/workspace_name/key
region – The region of the S3 bucket and DynamoDB table.
bucket – The name of the S3 bucket.
dynamodb_table – The name of a DynamoDB table to use for state locking and consistency. The table must have a primary key named LockID. If not present, locking will be disabled.
encrypt – Whether to enable server side encryption of the state file.

[Please refer to the Terraform Docs ](https://www.terraform.io/docs/backends/types/s3.html)

## Terraform Usage
Include the following in your variables.tf file:

```hcl
terraform {
 backend “s3” {
 key = path/to/my/key 
 region = us-east-1
 bucket = "unique-name-terraform-state-file-storage"
 dynamodb_table = "terraform-state-locking"
 encrypt = true # Optional, S3 Bucket Server Side Encryption
 }
}
```
