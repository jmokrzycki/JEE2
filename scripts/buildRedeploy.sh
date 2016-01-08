#!/bin/sh

echo "************ UNDEPLOYING *******************"
./../tje2/scripts/glassfish3/glassfish/bin/asadmin undeploy bazaFilmow
echo "************ BUILDING **********************"
mvn package
echo "************ DEPLOYING *********************"
./../tje2/scripts/glassfish3/glassfish/bin/asadmin deploy target/bazaFilmow.war
