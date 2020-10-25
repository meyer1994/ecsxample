# ECS Example

[![Build Status](https://travis-ci.com/meyer1994/ecsxample.svg?branch=master)](https://travis-ci.com/meyer1994/ecsxample)

A simple, multi containered service running on AWS [ECS][1]

## About

This was created as a way to learn the inner workings of AWS ECS together with
some [Terraform][2]. It will deploy a (very) simple [FastAPI][3] app together
with a [Postgres][4] instance. Note that the database instance will not persist
any data when it reboots. It is just for testing/demonstration purposes.

## Deploy

This is a 2 step process. First you need to send your docker container to a
registry. Or, if you want, you can use the one from [this][5] repo. After you
have the image in a registry, you will need to update the `container_name` value
in the `infra/service/containers.tf` file to point to your image.

After that, you will just need to deploy the ECS cluster and the service. To do
that, you must have your AWS credentials already set up. From inside the `infra`
directory, run the following:

```bash
terraform init
terraform apply --auto-approve
```

## Disclaimer

This repo is for learning/demonstration purposes. **Do not use this code in
production**. The infrastructure is not safe agains DOS attacks or anything
else.


[1]: https://aws.amazon.com/pt/ecs/
[2]: https://terraform.io/
[3]: https://fastapi.tiangolo.com/
[4]: https://postgresql.org/
[5]: https://hub.docker.com/repository/docker/meyer1994/ecsxample
