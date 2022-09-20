terraform {
    backend "gcs" {
        bucket      = "jbc-static-websites-tf-state"
        prefix      = "tf-state"
    }
}
