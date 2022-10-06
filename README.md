# Doc
`build golang code in container, and deploy a lambda function with role default.`

## Parameters

```json
{
  "LAMBDA_FUNCTION_NAME": "your_function_name_her",
  "ROLE_NAME": "your_role_name_her"
}
```

## Installation
- download code in main folder of your project.
- in folder need have basic files: main.go, go.mod, go.sum
- main.go with lambda.Start(handlerRequest)
- create file <nameFile>.json and set the parameters required *optional

### USAGE
    
```bash
terraform init
terraform plan -env-file="<nameFile>.json"
terraform apply -env-file="<nameFile>.json"

terraform destroy -env-file="<nameFile>.json"
```

### Output
`function_name`
`function_arn`