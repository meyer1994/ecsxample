.PHONY: tf validate


tf:
	docker run --rm -dt \
		--name 'tf' \
		--entrypoint 'tail' \
		--workdir '/home' \
		--volume $(shell pwd):/home \
		--volume ~/.aws:/root/.aws:ro \
		hashicorp/terraform


validate: tf
	docker exec tf sh -c 'terraform init ./cluster'
	docker exec tf sh -c 'terraform init ./service'
	docker exec tf sh -c 'terraform validate ./cluster'
	docker exec tf sh -c 'terraform validate ./service'
	docker kill tf
