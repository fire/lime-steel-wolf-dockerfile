FROM vault:1.12.2

ENV SKIP_SETCAP=true
ENV VAULT_LOCAL_CONFIG={"storage": {"file": {"path": "/vault/file"}}, "listener": [{"tcp": { "address": "0.0.0.0:8080"}}], "default_lease_ttl": "168h", "max_lease_ttl": "720h", "ui": true}
CMD ["server"]
