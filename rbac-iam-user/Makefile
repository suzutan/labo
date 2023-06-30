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
gcloud-setup:
	gcloud components install gke-gcloud-auth-plugin
set-context:
	gcloud config set project suzutan0s2-286610
	gcloud container clusters get-credentials labo-basic-gke --region asia-northeast1

apply-manifest: set-context
	kustomize build manifests/overlays/team-a | kubectl apply -f-
	kustomize build manifests/overlays/team-b | kubectl apply -f-
