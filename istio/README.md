## Summary
#### I did write this python/flask application which is supposed to give you the opportunity to register and preview basic details about new employee, the application stores the data in MYSQL DB as backend as well it connects to other microserviece using API and retreive version data too. 

## Prerequisites
1. Kuberentes cluster 
2. Istio as service mesh 

## Final application infrastraucture with canary deployment
![Pipeline demo](../files/app-infra-canary-output.png) 

### Exporting istio external/public IP address
```bash
export IP=$(kubectl get svc istio-ingressgateway -n istio-system -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
```

### access application via APIs
```
>> http://IP/welcome 
>> http://IP/api/register
>> http://IP/api/details/[employee_first_name]
>> http://IP/api/health
>> http://IP/api/info 
>> http://IP//api/hostname 
```
  
http://IP/welcome 
![welcome page](../files/api-welcome.png) 
http://IP/api/details/[employee_first_name]
![details page](../files/api-details.png) 
 http://IP/api/health
![health page](../files/api-details.png) 
http://IP/api/info 
![info page](../files/api-info.png)
http://IP/api/register
![register page](../files/register-page.png)

### My idea here is to build to show how the microservices works all together , plus integrating this with service mesh (istio) to acheive different deployment strategies like canary releases, blue/green deployment , traffic injection and mirroring and etcetera

### You can register a user by sending post request 
```
curl -X POST -H "Content-Type: application/json" -d '{
  "firstname": "Mark",
  "lastname": "lars",
  "department": "IT",
  "email": "mark.lars@gmail.com"
}' http://10.0.0.200/api/register
```

### Requirement for making it running and ready
- Kubernetes cluster either locally or on AWS or on GKE
- Run below command 
```bash
# deploy the chart for development environment 
helm install --generate-name  ./employees --set environment=development
# deploy the chart for production environment 
helm install --generate-name  ./employees --set environment=production
```