FROM vault:1.12.2

CMD ["server"]

ENV SKIP_SETCAP=true
ENV VAULT_ADDR='http://127.0.0.1:8080'