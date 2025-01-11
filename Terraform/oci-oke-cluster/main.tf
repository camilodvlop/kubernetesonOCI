provider "oci" {
  
}

variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}
resource "oci_core_vcn" "vcn" {
  cidr_block = "10.0.0.0/16"
  display_name = "oke-vcn"
  compartment_id = var.compartment_id
}

resource "oci_core_subnet" "subnet" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  cidr_block     = "10.0.0.0/24"
  availability_domain = var.availability_domain
  prohibit_public_ip_on_vnic = false
}

resource "oci_containerengine_cluster" "oke_cluster" {
  name             = "free-tier-cluster"
  compartment_id   = var.compartment_id
  kubernetes_version = "v1.31.1"
  vcn_id           = oci_core_vcn.vcn.id
  options {
    kubernetes_network_config {
      pods_cidr     = "10.244.0.0/16"
      services_cidr = "10.96.0.0/16"
    }
  }
}

resource "oci_containerengine_node_pool" "node_pool" {
  name           = "node-pool"
  compartment_id = var.compartment_id
  cluster_id     = oci_containerengine_cluster.oke_cluster.id
  node_shape     = "VM.Standard3.Flex"
  node_shape_config {
      memory_in_gbs = 6
      ocpus         = 1
    }
  node_source_details {
    source_type       = "image"  # Tipo de origen
    image_id   = "ocid1.image.oc1.sa-bogota-1.aaaaaaaayyovvead3dr2m6e7c44ripwvgeclepuqicz5dgt2etcm3olwk5xa"
     
  }
  node_config_details {
    placement_configs {
      availability_domain = var.availability_domain
      subnet_id           = oci_core_subnet.subnet.id
    }
    
    size = 1
  }

  
 
}