do_token                 = "***token"
project_name             = "staging-project"
vpc_name                 = "cluster-vpc-staging"
vpc_ip_range             = "10.200.0.0/24"
cluster_name             = "geobuyer-staging-cluster-staging"
region                   = "fra1"
kubernetes_version       = "1.30.2-do.0"
ha                       = false
surge_upgrade            = true
maintenance_day          = "any"
maintenance_start_time   = "12:00"
node_pool_1_name         = "pool-4-8g"
node_pool_1_size         = "s-4vcpu-8gb"
node_pool_1_count        = 4
node_pool_1_auto_scale   = true
node_pool_1_min_nodes    = 3
node_pool_1_max_nodes    = 5
node_pool_1_tags         = ["k8s", "k8s:worker"]
node_pool_2_name         = "pool-es-4-8"
node_pool_2_size         = "s-4vcpu-8gb"
node_pool_2_count        = 3
node_pool_2_auto_scale   = false
node_pool_2_min_nodes    = 3
node_pool_2_max_nodes    = 3
node_pool_2_tags         = ["k8s", "k8s:worker"]
node_pool_2_taint_key    = "instancetype"
node_pool_2_taint_value  = "elasticsearch"
node_pool_2_taint_effect = "NoSchedule"
cluster_tags             = ["geobuyer-staging", "k8s"]
# Database configuration
app_database_name = "geobuyer-pgsql-staging-pg"
app_user_name     = "geobuyer_user"

#Storage configuration
spaces_region = "fra1"