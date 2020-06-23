# providers content

The file `providers-yaml.txt`  is a yaml file but the command `kpt live apply . --reconcile-timeout=10m` has problems with yaml files that are not kubernetes manifest,
so this is a workaround to avoid errors with it.

then it will rename using

```yaml
        - name: dashboards-providers
          configMap:
            name: dashboards-providers
            items:
            - key: providers-yaml.txt
              path: providers.yaml
```
