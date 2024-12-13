# Access database to sql via Docker-container

## Description

Transfer access file database to postgres

## Install

Build docker image

```sh
docker build --tag access-2-db .
```

## Usage

Run docker image and connect database file via volume

```sh
docker run \
--network other_docker_network \
-e DB_NAME="db_name_for_export" \
-e DB_USER="user" \
-e DB_PASSWORD="password" \
-e DB_HOST="db" \
-e DB_PORT="5432" \
--rm \
-v "./access/:/data/" \
access-2-db access_base.accdb 
```

### Where

- `./access/` - directory with access file `access_base.accdb`
- `access_base.accdb` - access database
- `other_docker_network` - use when you need connect to postgres in container
