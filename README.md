# Terraform Base 
## about:project

This is a terraform repository to store and build a infrastructure to serve simple and static websites; 

## resources
Resources included are: 
- vpc network
- storage (gcs) to hold the static websites
- prod and dev projects
- uses a manually created backend (storage, service account)
- a simple VM with wordpress configured to manage the websites in GCS
- a snapshot(TBD: snapshot, image, disk?) stored in another project to serve as a default config

## nice to have

- Include a LB before the buckets so it can distribute better the traffic
- Use Cloud CDN to optimize delivery - maybe overkill for static websites, with low content

