# Ansible - Using Jinja2, Terraform and Az Cli

The following is to test the creation a Resource Group for a customer and create/assign a dedicated SPN to it as a owner.

In this scenario we provide template files inside `templates` directory. These are used to create the terraform files outputed to `output/tf` folder. The values present in the templates are appended into the destination files.

Terraform then execute the tf files along with tfvars provided.

Finally Az Cli is used to create a SPN dedicated for the Resource Group and assign as Owner.


## Prereq

* install az cli [see microsoft doc](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest#manual-install-instructions)
* spn to execute tasks, information stored in `secrets.json` (not committed)
  * the spn is used to execute the terraform configuration and az cli commands
  * the spn need to be 'Global Administrator' in AAD in order to create spn app registration. The assignment can take 10/20 min to take effect
* `config.json` with configuration to apply

### Example of secrets.json

Most of the following information is shown when creating the SPN account. You also need to include the subscription id.

```
{
    "appId": "<appid>",
    "password": "<passw>",
    "tenant": "<tenantid>",
    "subscription_id": "<subscriptionid>"
}
```

### Example of config.json

```
{
    "customer_location":"westus",
    "customer_resourcegroup_basename":"ansibletest2",
    "myvar":{
        "aa":"one",
        "bb":"two"
    },
    "customer_spn_basename":"ansibletestsspn2"
}
```

## Tasks to perform

1. Use the Template files provided in `templates` directory
2. Copy files to destination while append values
3. execute terraform init, plan, apply with variables provided
4. az login and az set context to subscription id
5. create spn dedicated for resource group
6. set spn as owner of the resource group

## Usage

Just run the following:

```
./deploy.sh
```

This will just run `ansible-playbook` against the `main.yml` at the root for the repository