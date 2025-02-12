# Todos:

- add security groups rulles -> in progress
- add rds-proxy -> in progress
- add fsx filesystem and volume
-

## motes

> how to get current versions of aurora postgres in region

```bash
aws rds describe-db-engine-versions --engine aurora-postgresql --query '*[].[EngineVersion]' --output text --region eu-west-1
```

## tflint

status: ok (clean)
