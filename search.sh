#!/bin/bash
#########
# Some example ldap searches
#

BASEDN="dc=uakron,dc=edu"

echo "Searching for fred"
ldapsearch -x -b $BASEDN '(cn=fred)'

echo "Search for fred or tom"
ldapsearch -x -b $BASEDN '(| (cn=fred)(cn=tom) )'

echo "Search for objectClass=top AND fred"
ldapsearch -x -b $BASEDN '(& (objectClass=top)(cn=fred) )'
