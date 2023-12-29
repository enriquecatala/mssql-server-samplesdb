#!/bin/bash

#  Enrique Catalá:
#    Web:      https://www.clouddataninjas.com
#    Linkedin: https://www.linkedin.com/in/enriquecatala/
#    Support:  https://github.com/sponsors/enriquecatala


# Start SQL Server
/opt/mssql/bin/sqlservr & /var/opt/mssql/setup/setup.sh
eval $1