# OCP4-Day2

These playbooks help to configure OCP after a cluster has been installed.

The playbooks use the vars.yml and vault.yml files.

Do not commit an unencrypted vault.yml file to Github.  The example-vault.yml file 
is just an example and should not be filled in.

To run the playbooks:
./playbook.yml --ask-vault-pass -t {role name} -e {action}=true

Example:
Configure ldap authentication:
./playbook.yml --ask-vault-pass -t openshift_config_ldap -e apply=true

Teardown ldap authentication:
./playbook.yml --ask-vault-pass -t openshift_config_ldap -e teardown=true


