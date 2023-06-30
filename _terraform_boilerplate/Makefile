.PHONY: all

init:
	terraform init --reconfigure

fmt:
	terraform fmt -recursive .
plan: init fmt
	terraform plan

apply: init fmt
	terraform apply -auto-approve

destroy: init fmt
	terraform destroy

gcloud-login:
	gcloud auth login
	gcloud config set project suzutan0s2-286610
	gcloud components install gke-gcloud-auth-plugin
