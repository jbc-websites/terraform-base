module "instances" {
  source     = "./modules/instances"
}
module "storage" {
    source = "./modules/storage"
}
module "network" {
    source = "./modules/network"
}
