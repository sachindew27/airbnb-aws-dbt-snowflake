# Airbnb Snowflake dbt Project

This repo contains a dbt project that models Airbnb-style data on Snowflake using a bronze -> silver -> gold pattern.

## Project layout
- `aws_dbt_snowflake_project/` - dbt project root
- `aws_dbt_snowflake_project/models/` - bronze, silver, and gold models
- `aws_dbt_snowflake_project/snapshots/` - snapshots for dimensions
- `aws_dbt_snowflake_project/macros/` - custom macros

## Prerequisites
- dbt Core installed
- Snowflake account and credentials
- `~/.dbt/profiles.yml` configured with a target named `dev` (or update the target in commands below)

## Common commands
Run from `aws_dbt_snowflake_project/`:

```bash
dbt debug
dbt compile
dbt run
dbt snapshot
```

Run a single model:

```bash
dbt run --select <model_name>
```

## Notes
- Some models use incremental materializations and rely on a `CREATED_AT` high-water mark.
- Ephemeral models are inlined into downstream SQL and are not built as tables/views.
