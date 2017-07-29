Configuration
=============
The container has a built-in configuration file that looks like this:
```
[infinoted]
key-file=/data/infinoted-key.pem
certificate-file=/data/infinoted-cert.pem
security-policy=require-tls
log-file=/logs/infinoted.log
root-directory=/data/storage
plugins=note-text;autosave

[autosave]
interval=10
```
If you need a special config, create one and uncomment the corresponding line in the example composefile.

Example Composefile
===================
```yml
version: '2'

services:
    infinoted:
        image: lucebac/infinoted
        volumes:
            - ./infinoted/data:/data
            - ./infinoted/logs:/logs
            # if you need a custom config, uncomment the following line
            # - ./infinoted/config:/etc/infinoted:ro
            - /etc/localtime:/etc/localtime:ro
        ports:
            - "6523:6523"
```

