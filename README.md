## Getting Started

We provide a sample app using Dockerfile that you can deploy on fly.io.

```powershell
iwr https://fly.io/install.ps1 -useb | iex
fly launch
fly volumes create vault_file -s 1
fly deploy
```

Generate a pgp version of the gpg key.

```bash
gpg --export B42F5EE2E429AEA1 | base64 > B42F5EE2E429AEA1.asc
cat B42F5EE2E429AEA1.asc
# Copy to the vault.
```

Unseal the vault.

```
echo wcBMA1uLaxpz15I1AQgA09+JL0H7QI2yMW/mJ8Vj1WuEz60cwytFxjl0pPglEj1hbMUb1FHHtV/ky9t3EzqN/iPp4EWounOMbl8K5YYAeHSDBmZWbtUe/idur4r+n28eLK8/CD+PAzecHKYQjtX6lRtJ3mJFFY9J720cJ55XaXtyf5bD09ELf+sVte3Lv6PX1feg2SJeQdXRH+hIgUuzRCDs4OPsF96cfwMLdLcHTSrPULXGHW0H43r0niSXqdopc17s/FJnvPEg4AxAhn8K1Tw/QdL478kbFrXLL29RFk32g9LgLQ5b4ihkH4tncPv4Qw+v4XMPpXha1jZBBH9MKT2QHg5gLZ9ia0US4JlcgdLgAeQKB6/vMl2ZzZllsW+DNFgQ4Vz84LXgIuGIo+Bc4nRd7oPgzeZJJBXlHOb6GpVmQmXk51w0AN+3VHuXkjhZlkPU8mjwmdiU9mlcQPsCDHNCrGtUx7CW9HIQa4J/gPNuyZ4/0yZ14Kjke/vI0TPzqpLZkkgL/WbI0eLkVTru4UaCAA== | base64 -d > key
gpg -d key
# Copy this as a key shard
```


```
echo wcBMA1uLaxpz15I1AQgAe4JWevoDKy5D2NM0yIloFvA4VU6dFEVTxC7X2PBSS6gQW2wSsB6GEqdarfzjgrUhcTYFl17XyXZqb9NSJT34JcKAyYIg4aG3RJ1Lss7FcgkbbWZr+vkuvfN+cve3etmYEN4qEOrbonmVoKj8Gf5EIG/6a1URUJMpNE75HN5OgtxP/rgRZncYxGL5n/pnb+AvGiROONK9QKXxRqgqJOtKiG3eMJULuY/Um/PiPH04nkH6wzDc3XcFl22kSjLXcdjIgpiI1Fs4l2P5tOnsvb1RmURIka8MZgA5/Vip8BOoUj4ANUMufdCnKw7y3uMdfSqoZ1t2+hvkx8gXA8KcnIeyNNLgAeRQVOiT+YvQMlnOzKMIjuNa4XCq4KjgZOHE/eAa4qYqGU3gJ+QA4QGwVaZ4zvj0pEmrEuRq4IvjdnPwb6JMJFDgq+J7XaUg4Fvkmn+MKvqDztZIz5uxOhyxJ+KaV5uH4TI1AA== | base64 -d > token
gpg -d token
# Copy this as the root token
```