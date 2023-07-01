FROM docker.redpanda.com/vectorized/redpanda:v23.1.13

WORKDIR /

RUN mkdir -p /var/lib/redpanda/data/

CMD ["redpanda", "start", "--smp 1", "--memory 1G", "--reserve-memory 0M", "--overprovisioned", "--node-id 0", "--check=false", "--pandaproxy-addr PLAINTEXT://redpanda:8082,OUTSIDE://localhost:8082", "--advertise-pandaproxy-addr PLAINTEXT://redpanda:8082,OUTSIDE://0.0.0.0:8082", "--kafka-addr PLAINTEXT://redpanda:9092,OUTSIDE://localhost:9092", "--rpc-addr 0.0.0.0:33145", "--advertise-kafka-addr PLAINTEXT://redpanda:9092,OUTSIDE://0.0.0.0:9092", "--advertise-rpc-addr redpanda:33145"]
