#!/bin/bash

# Dieses Script baut die Entwicklungsumgebung für die Simi-Datenmigration auf. 
# Datenbankverbindungen müssen natürlich individuell angepasst werden. 
#
# Was ausserdem gemacht werden muss: 
# - Der Benutzer postgresql muss sich ohne Passwort anmelden können
# - Die "globals" müssen vorher in die DB importiert werden: 
#   psql -h 10.36.43.200 -p 54323 -d config -U postgres -c "SET ROLE postgres" -f Dropbox/Arbeit/Simi/globals_geodb.rootso.org.dmp

scp bjsvwsch@geoapp.verw.rootso.org:/opt/workspace/dbdump/soconfig_geodb.rootso.org.dmp Dropbox/Arbeit/Simi

pg_restore -h 10.36.43.200 -p 54323 -U postgres -d config Dropbox/Arbeit/Simi/soconfig_geodb.rootso.org.dmp --clean

psql -h 10.36.43.200 -p 54323 -d soconfig -U postgres -c "SET ROLE postgres" -q -f Dropbox/Arbeit/Simi/mig_trafo/mig/simi_ddl_20200910.sql

psql -h 10.36.43.200 -p 54323 -d soconfig -U postgres -c "SET ROLE postgres" -q -f Dropbox/Arbeit/Simi/mig_trafo/mig/base_attr_v.sql
