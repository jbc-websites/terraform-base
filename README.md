# terraform-base

GCS - to store the web files and serve it
A Wordpress server - to manipulate this content
A LB to serve the contents from the GCS
use only a single zone, only if, to use a region is free

Use a wordpress on a simple VM reading content on the buckets.
