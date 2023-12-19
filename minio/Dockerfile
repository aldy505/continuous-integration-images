FROM minio/minio:RELEASE.2023-12-14T18-51-57Z-cpuv1

RUN mkdir -p /data

HEALTHCHECK --interval=30s --timeout=20s --start-period=30s --retries=3 CMD [ "curl -f http://localhost:9000/minio/health/live" ]

CMD [ "minio", "server", "/data" ]
