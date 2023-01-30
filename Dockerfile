FROM vault:1.12.2

CMD ["server"]

ENV SKIP_SETCAP=true
ENV VAULT_LOCAL_CONFIG='{"storage": {"raft": "retry_join" { "leader_api_addr": "https://oyster-app-unyoe.ondigitalocean.app"}, {"path": "/vault/raft","node_id": "node_1"}},"listener": [{"tcp": { "address": "0.0.0.0:8080"}}], "default_lease_ttl": "168h", "max_lease_ttl": "720h", "ui": true}'

