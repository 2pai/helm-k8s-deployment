#! /usr/bin/make -f

USERNAME=move4up
APP=trivia
FE_DIR=./frontend
BE_DIR=./backend
FRONTEND_VERSION=1.0.0
BACKEND_VERSION=1.0.0
CHART_NAME=pintu-chart
CHART_DIR=./pintu-chart



.PHONY: backend-build frontend-build build update update-be update-fe publish publish-fe publish-be build-publish build-deploy-production build-deploy-staging delpoy-staging deploy-production

build: backend-build frontend-build

backend-build: update-be
	docker build -t $(APP)-backend:latest $(BE_DIR)
	docker tag $(APP)-backend:latest $(USERNAME)/$(APP)-backend:$(BACKEND_VERSION)

frontend-build: update-fe
	docker build -t $(APP)-frontend:latest $(FE_DIR)
	docker tag $(APP)-frontend:latest $(USERNAME)/$(APP)-frontend:$(FRONTEND_VERSION)

update: update-fe update-be

update-fe:
	cd $(FE_DIR) && npm install
update-be:
	cd $(BE_DIR) && npm install

publish: publish-be publish-fe

publish-be:
	docker login
	docker push $(USERNAME)/$(APP)-backend:$(BACKEND_VERSION)

publish-fe:
	docker login
	docker push $(USERNAME)/$(APP)-frontend:$(FRONTEND_VERSION)

build-publish: build publish

build-delpoy-production: build-publish deploy-production
build-deploy-staging: build-publish deploy-staging

deploy-production:
	helm upgrade --install $(CHART_NAME) \
	 -f $(CHART_DIR)/production-values.yaml \
	 --set trivia.frontend.image=$(USERNAME)/$(APP)-frontend \
	 --set trivia.backend.image=$(USERNAME)/$(APP)-backend \
	 --set trivia.frontend.tag=$(FRONTEND_VERSION) \
	 --set trivia.backend.tag=$(BACKEND_VERSION) \
	  $(CHART_DIR)

deploy-staging:
	helm upgrade --install $(CHART_NAME) \
	--set trivia.frontend.image=$(USERNAME)/$(APP)-frontend \
	--set trivia.backend.image=$(USERNAME)/$(APP)-backend \
	--set trivia.backend.tag=$(BACKEND_VERSION) \
	--set trivia.frontend.tag=$(FRONTEND_VERSION) \
	 $(CHART_DIR) 
