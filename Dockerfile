FROM gliderlabs/alpine:3.3

# Remove setuid and setgid permissions
RUN find / -type f \( -perm /u+s -o -perm /g+s \) -exec chmod ug-s {} \; || true

RUN apk add --no-cache py-pip py-gunicorn \
    && pip install --upgrade pip \
    && addgroup -S roleuser \
    && adduser -S -G roleuser roleuser \
    && mkdir -p /opt/app \
    && chown roleuser:roleuser /opt/app

COPY . /opt/app

WORKDIR /opt/app

RUN pip install -r requirements.txt \
    && rm requirements.txt

USER roleuser
EXPOSE 8080
ENTRYPOINT ["/usr/bin/gunicorn"]
CMD ["-b","0.0.0.0:8080", \
     "--log-file", "-", \
     "--log-level", "warning", \
     "--access-logfile", "-", \
     "wsgi:app"]
