FROM minio/minio:RELEASE.2023-08-29T23-07-35Z

RUN mkdir -p /data

HEALTHCHECK --interval=30s --timeout=20s --start-period=30s --retries=3 CMD [ "curl -f http://localhost:9000/minio/health/live" ]

CMD [ "minio", "server", "/data" ]
