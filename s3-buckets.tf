# S3 BUCKETS 
resource "aws_s3_bucket" "etl_bucket" {
  bucket = "${var._etl_bucket_name}"
  tags = {
    Name = "${var._etl_bucket_name}"
    Environment = "${var.tag_environment}"
    Application = ""
  }
}


resource "aws_s3_bucket" "logs_bucket" {
  bucket = "${var.s3_environment}-logs"
  acl = "private"
  tags = {
    Name = "${var.s3_environment}-logs"
    Environment = "${var.tag_environment}"
    Application = ""
  }
}

resource "aws_s3_bucket" "script_bucket" {
  bucket = "${var.emr_s3_script_bucket}"
  acl = "private"
  tags = {
    Name = "${var.emr_s3_script_bucket}"
    Environment = "${var.tag_environment}"
    Application = ""
  }
}

resource "aws_s3_bucket" "emr_s3_cedp_exception_bucket" {
  bucket = "${var.emr_s3_cedp_exception_bucket}"
  acl = "private"
  tags = {
    Name = "${var.emr_s3_cedp_exception_bucket}"
    Environment = "${var.tag_environment}"
    Application = ""
  }
}

resource "aws_s3_bucket" "emr_s3_cedp_invalid_message_bucket" {
  bucket = "${var.emr_s3_cedp_invalid_message_bucket}"
  acl = "private"
  tags = {
    Name = "${var.emr_s3_cedp_invalid_message_bucket}"
    Environment = "${var.tag_environment}"
    Application = ""
  }
}

resource "aws_s3_bucket_public_access_block" "logs_bucket_policy" {
  bucket = "${var.s3_environment}-logs"
  block_public_acls = "true"
  block_public_policy = "true"
  restrict_public_buckets = "true"
  ignore_public_acls = "true"
}

resource "aws_s3_bucket_public_access_block" "etl_bucket_policy" {
  bucket = "${var._etl_bucket_name}"
  block_public_acls = "true"
  block_public_policy = "true"
  restrict_public_buckets = "true"
  ignore_public_acls = "true"
}

resource "aws_s3_bucket_public_access_block" "script_bucket_policy" {
  bucket = "${var.emr_s3_script_bucket}"
  block_public_acls = "true"
  block_public_policy = "true"
  restrict_public_buckets = "true"
  ignore_public_acls = "true"
}

resource "aws_s3_bucket_public_access_block" "cedp_exception_bucket_policy" {
  bucket = "${var.emr_s3_cedp_exception_bucket}"
  block_public_acls = "true"
  block_public_policy = "true"
  restrict_public_buckets = "true"
  ignore_public_acls = "true"
}

resource "aws_s3_bucket_public_access_block" "cedp_invalid_message_bucket_policy" {
  bucket = "${var.emr_s3_cedp_exception_bucket}"
  block_public_acls = "true"
  block_public_policy = "true"
  restrict_public_buckets = "true"
  ignore_public_acls = "true"
}