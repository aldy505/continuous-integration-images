FROM typesense/typesense:0.24.0.rcn43

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

HEALTHCHECK --interval=30s --timeout=15s --start-period=30s --retries=5 CMD [ "curl -f 'http://localhost:8108/health' || exit 1" ]

EXPOSE 8108

ENTRYPOINT ["/opt/typesense-server"]
