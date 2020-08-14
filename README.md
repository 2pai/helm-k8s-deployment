# Trivia-app
---
Hey, How are you? It's been a rough day? Let the Trivia-app give a trivia fact about this day.

#### Makefile Target
---
This is list of command to easily update,build,publish & deploy trivia-app.
```
make update                     (Update dependency of the Apps)
make build                      (Build The App into OCI Image)
make build-publish              (Build & Publish the OCI Image into Docker image registry)
make publish                    (Publish the OCI Image into Docker image registry)
make deploy-production          (Deploy using helm chart with auto-scaller ENABLED)
make deploy-stagging            (Deploy using helm chart)
make build-deploy-production    (Build app & deploy into k8s cluster with auto-scaller ENABLED)
make build-deploy-staging       (Build app & deploy into k8s cluster)
``` 

Default configuration. 
```

USERNAME=move4up            # Username Docker Registry
APP=trivia                  # the APP Name
FE_DIR=./frontend           # The Frontend app directory
BE_DIR=./backend            # The Backend app directory
FRONTEND_VERSION=1.0.0      # The FRONTEND version (TAG)
BACKEND_VERSION=1.0.0       # The FRONTEND version (TAG)
CHART_NAME=pintu-chart      # Name of your helm-chart
CHART_DIR=./pintu-chart     # Directory of your helm-chart
```

You can also override the default configuration. For example : 

##### Changing version app & build + Deploy into production mode.

```
make FRONTEND_VERSION=2.0.0 BACKEND_VERSION=2.0.0 build-deploy-production
```

---
&copy; [Iqbal Syamil](github.com/2pai)