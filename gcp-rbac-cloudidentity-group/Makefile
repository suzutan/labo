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
	gcloud config set project harvestasya-344919
	gcloud container clusters get-credentials labo-basic-gke --region asia-northeast1

build-manifest:
	kustomize build manifests/overlays


apply-manifest: set-context
	kustomize build manifests/overlays | kubectl apply -f-

check-iam:
	kubectl auth can-i delete deployment/nginx --as member-1@harvestasya.org --as-group team-a@harvestasya.org -n team-a || :
	kubectl auth can-i delete deployment/nginx --as member-2@harvestasya.org --as-group team-a@harvestasya.org -n team-a || :
	kubectl auth can-i delete deployment/nginx --as member-3@harvestasya.org --as-group team-b@harvestasya.org -n team-b || :
	kubectl auth can-i delete deployment/nginx --as member-4@harvestasya.org --as-group team-b@harvestasya.org -n team-b || :
	kubectl auth can-i delete deployment/nginx --as member-1@harvestasya.org --as-group team-a@harvestasya.org -n team-b || :
	kubectl auth can-i delete deployment/nginx --as member-2@harvestasya.org --as-group team-a@harvestasya.org -n team-b || :
	kubectl auth can-i delete deployment/nginx --as member-3@harvestasya.org --as-group team-b@harvestasya.org -n team-a || :
	kubectl auth can-i delete deployment/nginx --as member-4@harvestasya.org --as-group team-b@harvestasya.org -n team-a || :
