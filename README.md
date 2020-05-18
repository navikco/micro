# Kube-Microservices Demos

- Included in this DEMO 

_**Kube-Land Utility Scripts/Tools**_
---
| Component/Technology | Purpose |
| ------------- | ------------- | 
| **Spring Boot Microservices** | Java Spring Boot Microservices for TEST/DEMO |
| **Spring Boot Admin Console** | Java Spring Boot Admin Console for Microservices Monitoring from <BR/> https://github.com/codecentric/spring-boot-admin  |
| **Netflix Eureka** | Eureka Service Registry/Catalog |
| **Netflix Zuul** |  Zuul for Service Proxy & Routing | 
| **Netflix Ribbon** | Ribbon for Service Proxy & Routing |
| **Gradle** | For building Spring Boot Microservices |
| **Rest API Docs** | For Auto-generating Spring Boot Microservices REST API Documentation |


`git clone https://github.com/navikco/micro.git`

`cd micro/`

`chmod 700 micro_hack.sh`

`./micro_hack.sh blue admin 8761 build`

`./micro_hack.sh blue accounts 8080 build`

`./micro_hack.sh blue customers 8081 build`

`./micro_hack.sh blue products 8082 build`

`./micro_hack.sh blue users 8083 build`

     
- You can Browse your Spring Boot Admin (SBA) Console on --> 

    http://localhost:8761/admin/wallboard/


- You can Browse your Auto-generated Rest API Docs on --> 

    http://localhost:8761/kube/customers/info/index.html
    
    http://localhost:8761/kube/users/info/index.html


- Verify if your Microservices are working in your Local Kubernetes Cluster
    
    - Microservice Endpoint
 
        `curl 'http://localhost:8761/kube/accounts/300' -i -X GET -H 'Accept: application/json'`
        
        `curl 'http://localhost:8761/kube/customers' -i -X GET -H 'Accept: application/json'`
        
        `curl 'http://localhost:8761/kube/users' -i -X GET -H 'Accept: application/json'`
    
