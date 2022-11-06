# Security Blog

- Deploy Docker container on web server with cyberxsecurity/ansible image
- Configure ansible container to install web app
- Link custom domain
- Self sign certificate with Let's Encrypt
- Explore Azure Security options and recommendations

#### SSL Let's Encrypt
```bash
sudo apt install certbot # install certbot

certbot certonly --manual --preferred-challenges=dns --email contact@domain.com --server 
https://acme-v02.api.letsencrypt.org/directory --agree-tos --domain "website.com" --work-dir
/path/to/work-dir --config-dir /path/to/config-dir --logs-dir /path/to/logs-dir
 # send dns challenge to domain distributor

>>> # Complete verification challenge by inputting dns record values <<<

openssl pkcs12 -inkey /work-dir-path/live/website.com/privkey.pem -in /work-dir-path/live/website.com/cert.pem -export -out /work-dir-path/live/website.com/cert.pfx # change privatekey and cert to pfx file for Azure

>>> # Upload to Azure and sign certificate to web application <<<
