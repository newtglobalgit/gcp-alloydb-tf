module "alloydb_mumbai" {
  source  = "GoogleCloudPlatform/alloy-db/google"
  version = "~> 3.0"

  primary_cluster_name = module.alloydb_delhi.cluster_name ## Comment this line to promote this cluster as primary cluster

  cluster_id       = "cluster-${var.region_mumbai}-psc"
  cluster_location = var.region_mumbai
  project_id       = var.project_id

  psc_enabled                   = true
  psc_allowed_consumer_projects = [var.attachment_project_number]

  cluster_encryption_key_name = google_kms_crypto_key.key_region_mumbai.id

  primary_instance = {
    instance_id = "cluster-${var.region_mumbai}-instance1-psc",

    client_connection_config = {
      require_connectors = false
      ssl_config         = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"
    }
  }

  continuous_backup_enable               = true
  continuous_backup_recovery_window_days = 10
  continuous_backup_encryption_key_name  = google_kms_crypto_key.key_region_mumbai.id

  automated_backup_policy = {
    location      = var.region_mumbai
    backup_window = "1800s"
    enabled       = true
    weekly_schedule = {
      days_of_week = ["FRIDAY"],
      start_times  = ["2:00:00:00", ]
    }
    quantity_based_retention_count = 1
    time_based_retention_count     = null
    labels = {
      test = "alloydb-cluster-with-prim"
    }
    backup_encryption_key_name = google_kms_crypto_key.key_region_mumbai.id
  }

  depends_on = [
    module.alloydb_delhi,
    google_kms_crypto_key_iam_member.alloydb_sa_iam_secondary,
    google_kms_crypto_key.key_region_mumbai,
  ]
}
