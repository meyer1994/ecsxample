
terraform:
	docker run --rm -it \
		--entrypoint sh \
		--workdir /home \
		-v $(shell pwd):/home \
		-v ~/.aws:/root/.aws:ro \
		hashicorp/terraform
