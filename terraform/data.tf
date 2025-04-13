# data "terraform_remote_state" "terraform_aws_template_state" {
#   backend = "s3"
#   config = {
#     bucket = "kazeusagi-tfstate"
#     key    = "terraform-aws-template/terraform.tfstate"
#     region = "ap-northeast-1"
#   }
# }
