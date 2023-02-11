# ClickHouse

If you'd like to only run a single node of ClickHouse, please use the ClickHouse image directly.
These images does not requires Zookeeper.

Github Actions workflow file sample:

```yaml
name: Your CI

on:
    # ...

jobs:
  job-name:
    name: Job Name
    services:  
      clickhouse_node1:
        image: ghcr.io/aldy505/clickhouse-node1
        options: >-
          --health-cmd "wget --spider -q localhost:8123/ping"
          --health-interval 15s
          --health-timeout 10s
          --health-retries 10
          --health-start-period 60s
          --hostname clickhouse_node1
          --restart on-failure:10
      clickhouse_node2:
        image: ghcr.io/aldy505/clickhouse-node2
        options: >-
          --hostname clickhouse_node2
          --restart on-failure:10
      clickhouse_node3:
        image: ghcr.io/aldy505/clickhouse-node3
        options: >-
          --hostname clickhouse_node3
          --restart on-failure:10
```

Cluster name: `ci_cluster`

Sample connection URL: `clickhouse://default:@clickhouse_node1:9000,clickhouse_node2:9000,clickhouse_node3:9000/default?dial_timeout=30000ms&max_execution_time=60&debug=false`
