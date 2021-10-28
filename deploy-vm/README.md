# create terraform.tfvars
    add variables
        token     = ""
        cloud_id  = ""
        folder_id = ""
        zone      = ""

# run 
    terraform init

    terraform fmt

    terraform validate

    terraform plan or terraform plan -out=tfplan

    