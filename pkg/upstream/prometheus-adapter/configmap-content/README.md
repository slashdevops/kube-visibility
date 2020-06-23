# configmap content

The file config-yaml.txt is a yaml file but the command `kpt live apply . --reconcile-timeout=10m` has problems with yaml files that ar not kubernetes manifest,
so this is a workaround to avoid errors with it.
