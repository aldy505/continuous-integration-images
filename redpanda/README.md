# Redpanda

How to use this image:
```yml
jobs:
  job_name:
    services:
      redpanda: # YES, the name MUST BE "redpanda"
        image: ghcr.io/aldy505/redpanda-ci:latest
        options: >-
          --health-cmd "rpk cluster health"
          --health-interval 10s
          --health-timeout 5s
          --health-retries 10
          --health-start-period 30s
          --restart on-failure:10
```

Connect to `redpanda:9092` to access the Kafka native API.
Connect to `redpanda:8082` to access the Pandaproxy API (see https://redpanda.com/blog/pandaproxy)
