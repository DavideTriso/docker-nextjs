FROM    node:22.9-alpine

ENV     ENV=prod
ENV     TZ=UTC

USER    root
RUN     apk update --no-cache \
        && apk add --update --no-cache \
            tzdata \ 
        && npm install --location=global sharp create-next-app@latest \
        && mkdir -p /app

WORKDIR /app

ENTRYPOINT  if [ ! -f "/app/package.json" ]; then \
                npx create-next-app@latest /app --typescript --eslint --no-tailwind --src-dir --app --import-alias '@/*' --use-npm; \
            fi \
            && npm install \
            && if [ $ENV = "dev" ]; then \
                npm run dev; \
            else \
                npm run build && npm run start; \
            fi

EXPOSE  3000