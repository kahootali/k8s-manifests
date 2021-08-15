helm template pg-release bitnami/postgresql -n test -f pg-values.yaml > pg.yaml
helm install pg-release bitnami/postgresql -n test -f pg-values.yaml  


psql -h pg-release-postgresql -U ali123 test-db
\c test-db;
CREATE TABLE test(
   data VARCHAR (255) NULL
)
select * from test;
insert into test values  ('Ali Kahoot 1');
