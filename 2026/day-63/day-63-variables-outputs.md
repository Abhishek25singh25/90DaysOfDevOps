# Day 63 -- Variables, Outputs, Data Sources and Expressions

In this project, I transformed my Terraform configuration from a static and hardcoded setup into a fully dynamic, reusable, and environment-aware infrastructure. Earlier, values like region, CIDR blocks, AMI IDs, instance types, and tags were hardcoded, which made the configuration inflexible and difficult to reuse. By introducing variables, tfvars, outputs, data sources, locals, and built-in functions, the infrastructure is now scalable and adaptable across different environments.

Task 1: Extract Variables  
I created a variables.tf file and defined input variables for region, vpc_cidr, subnet_cidr, instance_type, project_name, environment, allowed_ports, and extra_tags. The project_name variable was intentionally defined without a default value so that Terraform prompts for input during execution. All hardcoded values in main.tf were replaced with variable references using var.<name>. This made the configuration flexible and reusable.

Terraform supports five main variable types: string, number, bool, list, and map. In this project, I used string variables for region and instance type, list for allowed ports, and map for additional tags.

Task 2: Variable Files and Precedence  
To manage different environments, I created terraform.tfvars for the development environment and prod.tfvars for production. These files allow us to pass different values without modifying the main configuration.

terraform.tfvars:
project_name  = "terraweek"
environment   = "dev"
instance_type = "t3.micro"

prod.tfvars:
project_name  = "terraweek"
environment   = "prod"
instance_type = "t3.small"
vpc_cidr      = "10.1.0.0/16"
subnet_cidr   = "10.1.1.0/24"

I used different commands to test variable loading:
terraform plan (uses terraform.tfvars automatically)  
terraform plan -var-file="prod.tfvars" (uses production values)  
terraform plan -var="instance_type=t2.nano" (CLI override)  
export TF_VAR_environment="staging" and then terraform plan (environment variable override)

Variable precedence from lowest to highest is:
default values → terraform.tfvars → *.auto.tfvars → -var-file → -var → TF_VAR_* environment variables.  
This means higher priority values override lower ones.

Task 3: Outputs  
I created an outputs.tf file to expose important resource details such as vpc_id, subnet_id, instance_id, instance_public_ip, instance_public_dns, and security_group_id. After running terraform apply, Terraform printed all outputs. I verified that the instance_public_ip matched the IP shown in the AWS console. Outputs are useful for debugging, automation, and integration with other tools.

Task 4: Data Sources  
To remove hardcoding, I replaced the AMI ID with a data source that dynamically fetches the latest Amazon Linux AMI. I also added a data source to fetch available availability zones in the selected region and used the first AZ in the subnet configuration. This ensures that the infrastructure works across regions without any manual changes.

The key difference between a resource and a data source is that a resource creates and manages infrastructure, whereas a data source only fetches existing information from the provider.

Task 5: Locals  
I introduced a locals block to define reusable values such as name_prefix and common_tags. The name_prefix combines project_name and environment to create consistent naming across resources. The common_tags include Project, Environment, and ManagedBy fields. I replaced all Name tags using local.name_prefix and used the merge() function to combine common tags with resource-specific tags. This ensures consistent and professional tagging across all resources in AWS.

Task 6: Built-in Functions and Conditional Expressions  
I used terraform console to practice built-in functions such as upper(), join(), length(), lookup(), and cidrsubnet(). These functions help in string manipulation, working with collections, and subnet calculations.

I also implemented a conditional expression to dynamically assign instance type based on the environment:
If environment = "prod" → instance_type = "t3.small"  
If environment = "dev" → instance_type = "t2.micro"  

This allows the same configuration to behave differently depending on the environment, which is a key concept in real-world DevOps workflows.

Useful functions used in this project:
upper() converts a string to uppercase  
join() combines elements of a list into a single string  
length() returns the number of elements in a list  
lookup() retrieves a value from a map using a key  
cidrsubnet() calculates subnets from a given CIDR block  

Final Learning  
This project helped me understand how to design dynamic and reusable Terraform configurations. By eliminating hardcoded values and using variables, tfvars, outputs, data sources, locals, and functions, I can now create infrastructure that is scalable, maintainable, and environment-aware.

Rule to Remember  
Create → Test → Destroy
