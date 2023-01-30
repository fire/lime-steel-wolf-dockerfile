FROM vault:1.12.2

CMD ["server"]

ENV SKIP_SETCAP=true
ENV VAULT_LOCAL_CONFIG={"storage": "raft", "listener": [{"tcp": { "address": "0.0.0.0:8080"}}], 