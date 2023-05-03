FROM    node:17.9-alpine

ENV     ENV=$ENV

USER    root
RUN     npm install --location=global sharp \
        && mkdir -p /app

WORKDIR /app


ENTRYPOINT  npm install \
            && if [ $ENV = "dev" ]; then \
                npm run dev; \
            else \
                npm run build && npm run start; \
            fi

EXPOSE  3000