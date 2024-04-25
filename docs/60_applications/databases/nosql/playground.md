# Playground

Setup a playground for MongoDB with Docker.

`docker-compose.yml`:

```yml
version: '3.1'

services:
  mongo:
    image: mongo
    restart: always

  mongo-express:
    image: mongo-express
    restart: always
    ports:
      - 8081:8081
    environment:
      ME_CONFIG_MONGODB_URL: mongodb://mongo:27017/
      ME_CONFIG_BASICAUTH: false
```

```bash
docker-compose up -d
```

Open [http://localhost:8081](http://localhost:8081) in your browser.

!!! danger

    Do not edit the `admin`, `config` and `local` databases. They are used by MongoDB.

    Create a new database for your own data.
