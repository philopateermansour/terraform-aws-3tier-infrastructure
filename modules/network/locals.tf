locals {
  public_subnet_cidrs  = [for i in range(3) : cidrsubnet(var.vpc_cidr, 8, i)]
  private_subnet_cidrs = [for i in range(3, 9) : cidrsubnet(var.vpc_cidr, 8, i)]

  subnets = [
    {
      name       = "public-subnet-1"
      cidr_block = element(local.public_subnet_cidrs, 0)
      az         = "us-east-1a"
      public     = true
    },
    {
      name       = "public-subnet-2"
      cidr_block = element(local.public_subnet_cidrs, 1)
      az         = "us-east-1b"
      public     = true
    },
    {
      name       = "public-subnet-3"
      cidr_block = element(local.public_subnet_cidrs, 2)
      az         = "us-east-1c"
      public     = true
    },
    {
      name       = "private-subnet-1"
      cidr_block = element(local.private_subnet_cidrs, 0)
      az         = "us-east-1a"
      public     = false
    },
    {
      name       = "private-subnet-2"
      cidr_block = element(local.private_subnet_cidrs, 1)
      az         = "us-east-1b"
      public     = false
    },
    {
      name       = "private-subnet-3"
      cidr_block = element(local.private_subnet_cidrs, 2)
      az         = "us-east-1c"
      public     = false
    }
    # ,
    # {
    #   name       = "private-subnet-4"
    #   cidr_block = element(local.private_subnet_cidrs, 3)
    #   az         = "us-east-1a"
    #   public     = false
    # },
    # {
    #   name       = "private-subnet-5"
    #   cidr_block = element(local.private_subnet_cidrs, 4)
    #   az         = "us-east-1b"
    #   public     = false
    # },
    # {
    #   name       = "private-subnet-6"
    #   cidr_block = element(local.private_subnet_cidrs, 5)
    #   az         = "us-east-1c"
    #   public     = false
    # }
  ]

}