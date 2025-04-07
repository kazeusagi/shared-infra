# tfstate格納用のS3はローカルで管理するためルートモジュールを分けておく
module "s3" {
  source = "../modules/s3"
}
