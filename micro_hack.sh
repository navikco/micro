#!/bin/bash

echo "Deploying Kube Land Microservices to LOVELY MAC!!!"

if [[ $# -eq 4 ]]
then

    ENVIRONMENT=$1
    echo ${ENVIRONMENT}

    MICROSERVICE=$2
    echo ${MICROSERVICE}

    PORT=$3
    echo ${PORT}

    BUILD=$4
    echo ${BUILD}

    cd apps/${MICROSERVICE}/

    if [[ "$BUILD" == "build"  ]]
    then
        ./gradlew clean build
    fi

    echo "###Starting Microservice [${MICROSERVICE}] Without JMX PORT ###"

    if [[ "$MICROSERVICE" != "admin" ]]; then

        java -Dserver.port=${PORT} -DKUBE_ADMIN_HOST=localhost -DKUBE_ADMIN_PORT=8761 -DKUBE_PROFILE=${ENVIRONMENT} -Dspring.profiles.active=${ENVIRONMENT},composite -Dspring.cloud.config.enabled=true -Dserver.ssl.enabled=false -jar build/libs/${MICROSERVICE}-*.jar

    else

        java -Dserver.port=8761 -Dspring.profiles.active=${ENVIRONMENT} -Dspring.cloud.config.enabled=true -jar build/libs/${MICROSERVICE}-*.jar
    fi

else
    echo "Usage: . ./kube_hack.sh <<ENVIRONMENT>> <<MICROSERVICE>> <<PORT>> <<BUILD - build/nobuild>>"
    exit 1
fi

