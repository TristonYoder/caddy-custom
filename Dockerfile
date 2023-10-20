FROM docker.io/caddy:builder as builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@latest \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2@latest

FROM docker.io/caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
