data "aws_secretsmanager_secret" "this" {
  arn = var.db_password_ssm_arn
}

data "aws_secretsmanager_secret_version" "this" {
  secret_id = data.aws_secretsmanager_secret.this.id
}

# random id - to append to resource names to avoid conflicts
resource "random_id" "suffix" {
  byte_length = 4
}

# random password - for new user
resource "random_password" "this" {
  length  = 32
  lower   = true
  upper   = true
  number  = true
  special = false
}

# storing the initial RDS password in AWS Secrets Manager
resource "aws_secretsmanager_secret" "this" {
  name = "${var.environment}-db-user-${var.new_user_name}-${random_id.suffix.hex}"
}

# storing the initial RDS password in AWS Secrets Manager
resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = random_password.this.result
}

resource "postgresql_role" "this" {
  name               = "${var.new_user_name}-${random_id.suffix.hex}"
  login              = true
  password           = random_password.this.result
  encrypted_password = true
  roles              = var.new_user_roles_list
}

resource "postgresql_database" "this" {
  name              = var.new_user_db_name == null ? "${var.new_user_name}-${random_id.suffix.hex}" : "${var.new_user_db_name}-${random_id.suffix.hex}"
  owner             = postgresql_role.this.name
  template          = var.new_user_db_template
  lc_collate        = var.new_user_db_lc_collate
  connection_limit  = var.new_user_db_connection_limit
  allow_connections = var.new_user_db_allow_connections
}

resource "postgresql_grant" "this" {
  role        = postgresql_role.this.name
  database    = postgresql_database.this.name
  object_type = "database"
  privileges  = ["ALL"]
}
