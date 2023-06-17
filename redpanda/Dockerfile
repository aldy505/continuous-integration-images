FROM docker.redpanda.com/vectorized/redpanda:v23.1.12

WORKDIR /

RUN mkdir -p /var/lib/redpanda/data/

CMD ["redpanda", "start", "--smp 1", "--memory 1G", "--reserve-memory 0M", "--overprovisioned", "--node-id 0", "--check=false", "--pandaproxy-addr PLAINTEXT://0.0.0.0:28082,OUTSIDE://0.0.0.0:8082", "--advertise-pandaproxy-addr PLAINTEXT://kafka:28082,OUTSIDE://localhost:8082", "--kafka-addr PLAINTEXT://0.0.0.0:29092,OUTSIDE://0.0.0.0:9092", "--rpc-addr 0.0.0.0:33145", "--advertise-kafka-addr PLAINTEXT://kafka:29092,OUTSIDE://localhost:9092", "--advertise-rpc-addr kafka:33145"]
