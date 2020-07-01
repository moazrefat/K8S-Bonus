#### I did wrote this python/flask application which is supposed to give you you the opportunity to register and preview basic details about an employee as it stores the data in MYSQL DB as backend as well it connects to other microserviece using API and retreive version data too. 

> Application API:
>> http://IP/welcome 

>> http://IP/api/register

>> http://IP/api/details/[employee_first_name]

>> http://IP/api/health

>> http://IP/api/info 

>> http://IP//api/hostname 
  
#### My idea here is to build to show how the microservices works all together , plus integrating this with service mesh (istio) to acheive different deployment strategies like canary releases, blue/green deployment , traffic injection and mirroring and etcetera

#### You can register a user by sending post request 
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
  
  `helm install --generate-name  ./employees --set environment=production`

  `helm install --generate-name  ./employees --set environment=development`
