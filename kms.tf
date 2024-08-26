resource "google_project_service_identity" "alloydb_sa" {
  provider = google-beta

  project = var.project_id
  service = "alloydb.googleapis.com"
}

resource "random_string" "key_suffix" {
  length  = 3
  special = false
  upper   = false
}

resource "google_kms_key_ring" "keyring_region_delhi" {
  project  = var.project_id
  name     = "keyring-${var.region_delhi}-${random_string.key_suffix.result}"
  location = var.region_delhi
}

resource "google_kms_crypto_key" "key_region_delhi" {
  name     = "key-${var.region_delhi}-${random_string.key_suffix.result}"
  key_ring = google_kms_key_ring.keyring_region_delhi.id
}


resource "google_kms_crypto_key_iam_member" "alloydb_sa_iam" {
  crypto_key_id = google_kms_crypto_key.key_region_delhi.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${google_project_service_identity.alloydb_sa.email}"
}


## Cross Region Secondary Cluster Keys

resource "google_kms_key_ring" "keyring_region_mumbai" {
  project  = var.project_id
  name     = "keyring-${var.region_mumbai}-${random_string.key_suffix.result}"
  location = var.region_mumbai
}

resource "google_kms_crypto_key" "key_region_mumbai" {
  name     = "key-${var.region_mumbai}-${random_string.key_suffix.result}"
  key_ring = google_kms_key_ring.keyring_region_mumbai.id
}

resource "google_kms_crypto_key_iam_member" "alloydb_sa_iam_secondary" {
  crypto_key_id = google_kms_crypto_key.key_region_mumbai.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${google_project_service_identity.alloydb_sa.email}"
}