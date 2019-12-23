resource "aws_s3_bucket" "terraform_state_s3_bucket" {
    bucket = "${var.s3_bucket}"
 
    versioning {
      enabled = true
    }
 
    lifecycle {
      prevent_destroy = true
    }
 
    tags {
      Name = "Terraform State File Storage"
    }      
}

resource "aws_dynamodb_table" "terraform_state_locking_dynamodb" {
  name = "terraform-state-locking"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
 
  tags {
    Name = "Terraform State File Locking"
  }
}