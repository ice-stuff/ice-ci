.PHONY: help \
	pipeline

###### Help ###################################################################

help:
	@echo '    pipeline ............................ Updates the remote pipeline'
	@echo '    help ................................ prints this message'

###### Remote Concourse ########################################################

.secrets.yml:
	./pipeline/secrets/compile > .secrets.yml

pipeline: .secrets.yml
	fly -t ice-ci expose-pipeline --pipeline main
	fly -t ice-ci set-pipeline \
		-p main \
		-c ./pipeline/main.yml \
		-l .secrets.yml
