helm template mongo-release bitnami/mongodb -n test -f mongo-values.yaml > mongo.yaml
helm install mongo-release bitnami/mongodb -n test -f mongo-values.yaml  

mongo admin --host "mongo-release-mongodb-0.mongo-release-mongodb-headless.test.svc.cluster.local:27017,mongo-release-mongodb-1.mongo-release-mongodb-headless.test.svc.cluster.local:27017" --authenticationDatabase admin -u root -p root123

mongo admin --host "mongo-release-mongodb-1.mongo-release-mongodb-headless.test.svc.cluster.local:27017" --authenticationDatabase admin -u root -p root123

mongo admin --host "mongo-release-mongodb-0.mongo-release-mongodb-headless.test.svc.cluster.local:27017" --authenticationDatabase admin -u root -p root123
use inventory
db.inventory.insertMany([
   { item: "journal", qty: 25, status: "A", size: { h: 14, w: 21, uom: "cm" }, tags: [ "blank", "red" ] },
   { item: "notebook", qty: 50, status: "A", size: { h: 8.5, w: 11, uom: "in" }, tags: [ "red", "blank" ] },
   { item: "paper", qty: 10, status: "D", size: { h: 8.5, w: 11, uom: "in" }, tags: [ "red", "blank", "plain" ] },
   { item: "planner", qty: 0, status: "D", size: { h: 22.85, w: 30, uom: "cm" }, tags: [ "blank", "red" ] },
   { item: "postcard", qty: 45, status: "A", size: { h: 10, w: 15.25, uom: "cm" }, tags: [ "blue" ] }
]);


db.inventory.find({}).pretty()