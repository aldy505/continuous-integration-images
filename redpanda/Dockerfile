FROM docker.redpanda.com/vectorized/redpanda:v23.2.7

WORKDIR /

RUN mkdir -p /var/lib/redpanda/data/

CMD ["redpanda", "start", "--smp 1", "--memory 1G", "--reserve-memory 0M", "--overprovisioned", "--node-id 0", "--check=false"]
