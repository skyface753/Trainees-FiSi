# A example for LF9 at HEMS

## PHPMyAdmin

You can connect to the `db`-container with the following credentials:

- Host: `db`
- Username: `db_user`
- Password: `db_user_pass`

**But** you can **not** connect to the `mu-db``-container with the following credentials:

- Host: `mu-db`
- Username: `mumble`
- Password: `mumble`

!!! info

    The `mu-db`-container is only accessible from the `mumble-server`-container.

!!! note

    Both databases are not accessible from the outside.
    (You can not connect to them from your computer.)
