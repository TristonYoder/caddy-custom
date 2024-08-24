FROM docker.io/caddy:builder as builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@latest \

FROM docker.io/caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
