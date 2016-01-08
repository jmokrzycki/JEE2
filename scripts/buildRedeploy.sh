#!/bin/sh

echo "************ UNDEPLOYING *******************"
./scripts/glassfish3/glassfish/bin/asadmin undeploy bazaFilmow
echo "************ BUILDING **********************"
mvn package
echo "************ DEPLOYING *********************"
./scripts/glassfish3/glassfish/bin/asadmin deploy target/bazaFilmow.war
