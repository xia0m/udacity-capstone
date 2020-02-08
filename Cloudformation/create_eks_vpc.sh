aws cloudformation create-stack --stack-name eks-kub \
--template-body file://eks-vpc.yaml \
--parameters file://eks-vpc-params.json \
--capabilities CAPABILITY_NAMED_IAM