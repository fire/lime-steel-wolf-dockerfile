FROM vault:1.12.2

CMD ["server"]

ENV SKIP_SETCAP=true
ENV VAULT_LOCAL_CONFIG='{
  "default_lease_ttl": "168h",\
  "listener": [\
    {\
      "tcp": [\
        {\
          "address": "0.0.0.0:8080"\
        }\
      ]\
    }\
  ],\
  "max_lease_ttl": "8760h",\
  "storage": [\
    {\
      "raft": [\
        {\
          "retry_join": [\
            {
              "leader_api_addr": "https://oyster-app-unyoe.ondigitalocean.app"\
            }\
          ]\
        }\
      ]\
    }\
  ],\
  "ui": true\
}'