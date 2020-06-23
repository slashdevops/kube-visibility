# configmap content

The file `config-yaml.txt`  is a yaml file but the command `kpt live apply . --reconcile-timeout=10m` has problems with yaml files that are not kubernetes manifest,
so this is a workaround to avoid errors with it.

then it will rename using

```yaml
        - name: config
          configMap:
            name: prometheus-adapter-configuration
            items:
            - key: config-yaml.txt
              path: config.yaml  
```
