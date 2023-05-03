FROM    node:14.15-alpine

ENV     ENV=$ENV

USER    root
RUN     npm -g config set user root \
        && npm install -g sharp \
        && mkdir -p /app

WORKDIR /app


ENTRYPOINT  npm install \
            && if [ $ENV = "dev" ]; then \
                npm run dev; \
            else \
                npm run build && npm run start; \
            fi

EXPOSE  3000