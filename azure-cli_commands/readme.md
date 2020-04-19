# Ansible - Using Az cli command


## Prereq

* install jmespath `python -m pip install jmespath` to parse JSON file
* install az cli [see microsoft doc](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest#manual-install-instructions)
* spn to execute tasks, information stored in `secrets.json` (not committed)
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
    "location":"westus",
    "resourcegroup_basename":"ansibletest",
    "myvar":{
        "aa":"one",
        "bb":"two"
    }
}
```

## Tasks to perform

1. Read Json
2. Create variables for secret
3. az login
4. az set context to subscription id
5. create resource group
6. create spn dedicated for resource group
7. set spn as owner of the resource group

## Usage

Just run the following:

```
deploy.sh
```

This will just run `ansible-playbook` against the `main.yml` at the root for the repository