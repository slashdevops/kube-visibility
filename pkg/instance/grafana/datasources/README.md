# datasource content

The file `datasources-yaml.txt`  is a yaml file but the command `kpt live apply . --reconcile-timeout=10m` has problems with yaml files that are not kubernetes manifest,
so this is a workaround to avoid errors with it.

then it will rename using

```yaml
        - name: dashboards-datasources
          configMap:
            name: dashboards-datasources
            items:
            - key: datasources-yaml.txt
              path: datasources.yaml
```
