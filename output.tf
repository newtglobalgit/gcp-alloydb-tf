output "project_id" {
  description = "Project ID of the Alloy DB Cluster created"
  value       = var.project_id
}

output "cluster_delhi" {
  description = "cluster"
  value       = module.alloydb_delhi.cluster
}

output "primary_instance_delhi" {
  description = "primary instance created"
  value       = module.alloydb_delhi.primary_instance
}

output "cluster_id_delhi" {
  description = "ID of the Alloy DB Cluster created"
  value       = module.alloydb_delhi.cluster_id
}

output "primary_instance_id_delhi" {
  description = "ID of the primary instance created"
  value       = module.alloydb_delhi.primary_instance_id
}

output "read_instance_ids_delhi" {
  description = "IDs of the read instances created"
  value       = module.alloydb_delhi.read_instance_ids
}

output "cluster_name_delhi" {
  description = "The name of the cluster resource"
  value       = module.alloydb_delhi.cluster_name
}

output "primary_psc_attachment_link_delhi" {
  description = "The private service connect (psc) attachment created for primary instance"
  value       = module.alloydb_delhi.primary_psc_attachment_link
}

output "psc_dns_name_delhi" {
  description = "he DNS name of the instance for PSC connectivity. Name convention: ...alloydb-psc.goog"
  value       = module.alloydb_delhi.primary_instance.psc_instance_config[0].psc_dns_name
}

output "read_psc_attachment_links_delhi" {
  value = module.alloydb_delhi.read_psc_attachment_links
}

output "cluster_mumbai" {
  description = "cluster created"
  value       = module.alloydb_mumbai.cluster
}

output "primary_instance_mumbai" {
  description = "primary instance created"
  value       = module.alloydb_mumbai.primary_instance
}

output "kms_key_name_delhi" {
  description = "he fully-qualified resource name of the KMS key"
  value       = google_kms_crypto_key.key_region_delhi.id
}

output "kms_key_name_mumbai" {
  description = "he fully-qualified resource name of the Secondary clusterKMS key"
  value       = google_kms_crypto_key.key_region_mumbai.id
}

output "psc_consumer_fwd_rule_ip" {
  description = "Consumer psc endpoint created"
  value       = google_compute_address.psc_consumer_address.address
}

output "region_delhi" {
  description = "The region for primary cluster"
  value       = var.region_delhi
}

output "region_mumbai" {
  description = "The region for cross region replica secondary cluster"
  value       = var.region_mumbai
}