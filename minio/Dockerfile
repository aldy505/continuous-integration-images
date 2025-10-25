FROM minio/minio:RELEASE.2025-09-07T16-13-09Z-cpuv1

RUN mkdir -p /data

HEALTHCHECK --interval=30s --timeout=20s --start-period=30s --retries=3 CMD [ "curl -f http://localhost:9000/minio/health/live" ]

CMD [ "minio", "server", "/data" ]
