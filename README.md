# github

# Documentation
module template to aws lambda function, the parent module base need have aws provider, with api gateway and alternative values  \
in variables.tf, assign value to lambda function. \

# api gateway
the module is used as api resource, then if api resource have children sub resource, this is passed by the current module to children module \

# same function need have all methods, else, create sub module for each method

# with diferente workspace, the parent module set the value of workspace, and with this create multiple functions with - workspace name