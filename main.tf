terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "GitActions1"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}


resource "snowflake_schema" "demo_snowflake" {
  database = snowflake_database.demo_db.name
  name     = "demo_snowflake"
  comment  = "Schema for Snowflake Terraform demo"
}