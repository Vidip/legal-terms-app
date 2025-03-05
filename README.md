# legal-term-api

An HTTP API for legal terms.

## Endpoints

* `GET /terms`: list all available terms.
* `GET /definitions?term=<term>`: get the definition of a term.

## Development

docker build -t legal-term-api:latest .

minikube start

minikube image load legal-term-api:latest

### Install for development
helm install legal-term-api-dev ./helm -f helm/values-dev.yaml

### Install for production
helm install legal-term-api-prod ./helm -f helm/values-prod.yaml

### Upgrade existing deployment
helm upgrade legal-term-api-dev ./helm -f helm/values-dev.yaml

### Get the URL of the service
kubectl port-forward svc/legal-term-api 8080:80

### Stop the minikube cluster
minikube stop

## Troubleshooting:

### Check pod logs
kubectl logs -l app=legal-term-api

### Describe pod for more details
kubectl describe pod -l app=legal-term-api

### Check deployment status
kubectl describe deployment legal-term-api

### Check service status
kubectl describe service legal-term-api
