#!/bin/bash


# Create the k8s file to deploy flyway job after the container 
# has finished being created.
cat <<EOF >> flywaydb.yml
apiVersion: batch/v1
kind: Job
metadata:
  name: fecfile-flyway-db-job
spec:
  template:
    metadata:
      name: fecfile-flyway-db
    spec:
      containers:
        - name: fecfile-flyway-db
          image: 813218302951.dkr.ecr.us-east-1.amazonaws.com/fecfile-flyway-db:$1
          env:
          - name: DB_HOST
            value: $2
          - name: DB_NAME
            value: fecfile
          - name: DB_USERNAME
            valueFrom:
              secretKeyRef:
                name: db-creds
                key: dbuser
          - name: DB_PASSWORD
            valueFrom:
              secretKeyRef:
                name: db-creds
                key: password
          - name: DB_PORT
            value: "5432"
      restartPolicy: Never
EOF

POD=$(kubectl --context=arn:aws:eks:us-east-1:813218302951:cluster/fecfile4 --namespace=$3 get pods --selector=job-name=fecfile-flyway-db-job --output=jsonpath={.items..metadata.name})

# If there is an old job delete it. 
if [ ! -z "$POD" ]; then
  kubectl --context=arn:aws:eks:us-east-1:813218302951:cluster/fecfile4 --namespace=$3 delete job fecfile-flyway-db-job
fi

# create the job
kubectl --context=arn:aws:eks:us-east-1:813218302951:cluster/fecfile4 --namespace=$3 create -f flywaydb.yml

sleep 20
NEWPOD=$(kubectl --context=arn:aws:eks:us-east-1:813218302951:cluster/fecfile4 --namespace=$3 get pods --selector=job-name=fecfile-flyway-db-job --output=jsonpath={.items..metadata.name} | awk '{ print $1 }')
kubectl --context=arn:aws:eks:us-east-1:813218302951:cluster/fecfile4 --namespace=$3 logs $NEWPOD

