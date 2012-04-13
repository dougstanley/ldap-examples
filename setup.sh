#!/bin/bash
###################
# Get openldap setup
#
CWD=$(dirname $0)

echo "Installing packages, remember the password you choose."

sudo aptitude install -yq slapd ldap-utils

echo "Extra configuration of ldap server, mostly choose defaults."

sudo dpkg-reconfigure slapd

#need to figure out the admin's DN
DN=$(sudo slapcat|grep -i 'dn:\s*cn=admin'|awk '{print $2}')

echo "Populating base directory."
ldapadd -D $DN -f $CWD/foo.ldif -W
ldapadd -D $DN -f $CWD/people.ldif -W

echo "Done"

