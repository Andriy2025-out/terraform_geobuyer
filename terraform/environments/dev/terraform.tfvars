do_token               = "***token"
project_name           = "dev-project"
vpc_name               = "cluster-vpc-dev"
vpc_ip_range           = "10.114.0.0/20"
cluster_name           = "geobuyer-dev"
region                 = "fra1"
kubernetes_version     = "1.32.2-do.1"
ha                     = false
surge_upgrade          = true
maintenance_day        = "any"
maintenance_start_time = "20:00"

node_pool_1_name       = "pool-2cpu-4gb"
node_pool_1_size       = "s-2vcpu-4gb"
node_pool_1_count      = 1
node_pool_1_auto_scale = true
node_pool_1_min_nodes  = 1
node_pool_1_max_nodes  = 3
node_pool_1_tags       = ["k8s", "k8s:worker"]

node_pool_2_name         = "pool-4cpu-8gb"
node_pool_2_size         = "s-4vcpu-8gb"
node_pool_2_count        = 3
node_pool_2_auto_scale   = true
node_pool_2_min_nodes    = 1
node_pool_2_max_nodes    = 3
node_pool_2_tags         = ["k8s", "k8s:worker"]
node_pool_2_taint_key    = ""
node_pool_2_taint_value  = ""
node_pool_2_taint_effect = ""

cluster_tags = ["geobuyer-dev", "k8s"]

# Database configuration
app_database_name = "geobuyer-dev-pg"
app_user_name     = "geobuyer_user"

# Storage configuration
spaces_region = "fra1"