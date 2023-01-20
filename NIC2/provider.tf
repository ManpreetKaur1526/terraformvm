provider "azurerm" {
  features {}

  subscription_id = "e92f96e1-d0a9-4a78-a545-fc79b4e612dd"
  client_id       = "43f3bad2-407f-48a7-813a-5c1077817ad2"
  client_secret   = "WHp8Q~gzAlMZtV-5C39iuVlCnFtvAZhUaThxfbII"
  tenant_id       = "d2e12119-14a3-4115-a91f-a301f944fda6"
}

terraform {
  backend "azurerm" {
    storage_account_name = "testsa104925199"
    container_name       = "container4"
    key                  = "prod.terraform.tfstate"
    access_key = "Itwrn26dRzSHZE6pHceQSOvxFhZQgNXGnTyseq1O3i75SGtMeFW8u9wxgt/LU+HxA+QtlGUOWmxm+AStzn9Qzw=="
  }
}
