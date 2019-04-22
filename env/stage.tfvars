env = "stage"

aws_profile = "myaws"

aws_region = "us-east-1"

cidr = "10.2.0.0/16"

cidrs			= {
  public1  = "10.2.1.0/24"
  public2  = "10.2.2.0/24"
  private1 = "10.2.3.0/24"
  private2 = "10.2.4.0/24"
  rds1	   = "10.2.5.0/24"
  rds2     = "10.2.6.0/24"
  rds3     = "10.2.7.0/24"
}