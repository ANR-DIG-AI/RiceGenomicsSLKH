#!/bin/bash
# Author: Franck MICEHL, University Cote d'Azur, CNRS, Inria
# Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

# Before executing this scipt, make sure to set variables:
# - $VIRTUOSO_PWD: Virtuoso password for user dba
# - $VIRTUOSO_CONTAINER: name of the Docker container running Virtuoso

unzip -u RiceGenomicsSLKG.zip

docker exec $VIRTUOSO_CONTAINER \
	isql -H localhost -U dba -P $VIRTUOSO_PWD \
        exec="LOAD /dataset/ricegenomicsslkg/import.isql"
