FROM docker.redpanda.com/vectorized/redpanda:v23.2.17

WORKDIR /

RUN mkdir -p /var/lib/redpanda/data/

CMD ["redpanda", "start", "--smp 1", "--memory 1G", "--reserve-memory 0M", "--overprovisioned", "--node-id 0", "--check=false"]
