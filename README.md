# github

### commands
```bash
# move to the directory where exist terrafom files, inside this folder need exist folder function with code to deploye
cd ~/main_folder
terraform init # download provider
terraform plan # show what will be creat

# ... other commands
```


### Use
Deploy function in lambda aws with roles basic. \
in folder function set all code function.

### Variables
```json
{
  // workspace can be dev / prod / etc...
  // the reald name of the function is  lambda function name + workspace
  "LAMBDA_FUNCTION_NAME": "test-22", 
  
  // path of file json with the environment variables, if empty, the function will not have environment variables
  "PATH_ENVIRONMENT": "",
  
  // hanlder code,
  "HANDLER": "main",
  
  // real role name is role_name + workspace
  "ROLE_NAME" : "test-22-rol",
  
  // not implemented
  "API_ID" : "",
  "API_STAGE" : ""
}
```