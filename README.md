#Alpine EKS Tools

## What is this?
A docker image designed to run kubectl and aws-cli from within an alpine container.

## What is it for
My pipeline delivers k8s yaml resource files into an S3 bucket. That triggers (via aws magic) this component to pull the files from s3 and push them to k8s

## What is in it
 - Python 3 (+pip3)
 - AWS-CLI 1
 - kubectl

And dependencies

## Who will maintain it?
Nobody, please clone and update if you want to use it
