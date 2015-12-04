AUTH_LDAP_SERVER_URI = "ldaps://data.sns.gov:636/"
AUTH_LDAP_BIND_DN = ''
AUTH_LDAP_BIND_PASSWORD = ''
AUTH_LDAP_USER_DN_TEMPLATE = 'uid=%(user)s,ou=Users,dc=sns,dc=ornl,dc=gov'
AUTH_LDAP_GROUP_SEARCH = LDAPSearch( 'ou=Groups,dc=sns,dc=ornl,dc=gov', ldap.SCOPE_SUBTREE, '(objectClass=posixGroup)')


ldapsearch -x -H ldaps://ldapserver -b 'ou=active,ou=people,dc=example,dc=org' -D 'cn=admin,dc=example,dc=org' -W "cn=username"

ldapsearch -x -H ldaps://data.sns.gov:636/ -b 'ou=active,ou=Users,dc=sns,dc=ornl,dc=gov' -D 'cn=admin,dc=sns,dc=ornl,dc=gov' -W "cn=rhf"
