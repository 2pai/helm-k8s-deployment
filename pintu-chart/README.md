# Trivia-app charts
Helm chart for trivia-app

### Installing the chart
From root directory of trivia-app. Please edit the values.yaml before applying.

#### For stagging/development
``` 
helm install pintu-chart ./pintu-chart
```

#### For production (with auto-scaling Enabled)
```
helm install pintu-chart -f pintu-chart/production-values.yaml ./pintu-chart
```

### Configuration
| Parameter | Description | Default |
|-|-| -|
| trivia.pullPolicy|pullPolicy| IfNotPresent
| trivia.replica| number of replica| 1
| trivia.env.FRONTEND_PORT| Backend Port | "8080"
| trivia.env.BACKEND_PORT| Frontend Port| "3000"
| trivia.backend.image| Image for backend|  "move4up/trivia-backend"
| trivia.backend.tag| Tag for backend image| "1.0.0"
| trivia.frontend.image|Image for frontend| "move4up/trivia-frontend"
| trivia.frontend.tag|Tag for frontend image | "1.0.0"
| service.type| Type of service | LoadBalancer
| service.port| Target Port | 8080
| autoscaling.enabled| Set the HPA Enabled | false
| autoscaling.minReplicas| number min replica (HPA Enabled | 1
| autoscaling.maxReplicas| number max replica (HPA Enabled | 10
| autoscaling.targetCPUUtilizationPercentage| Target % CPU for scaling | 50
