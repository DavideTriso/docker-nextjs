FROM    node:14.15

ENV     ENV=$ENV

USER    root
RUN     npm -g config set user root \
        && npm install -g sharp \
        && mkdir -p /app

WORKDIR /app

            #remove package-lock.json to prevent the world from imploding
ENTRYPOINT  if [ -f package-lock.json ]; then \
                rm package-lock.json; \
            fi \
            && npm install \
            && if [ $ENV = "dev" ]; then \
                npm run dev; \
            else \
                npm run build && npm run start; \
            fi

EXPOSE  3000