# Mail

The Windows equivalent of a mail server is Microsoft Exchange Server. See [Microsoft Exchange](exchange.md) for more information.

## IMAP vs POP3

### POP3

- Post Office Protocol 3
- Downloads messages to the client
- **Deletes** messages from the server

- No synchronization between devices

  - If you read a message on one device, it will still be marked as unread on another device

- No folders
- No server-side search

### IMAP

- Internet Message Access Protocol
- **Synchronizes** messages between the server and the client
- Messages are stored on the server
- Folders
- Newer than POP3
- Server-side search

## SMTP

- Simple Mail Transfer Protocol
- Used to send emails
- Uses port 25 (unencrypted) or 587 (encrypted)
- Requires authentication
- Can be used to send emails from a **client to a server**, or from a **server to another server**

## Variants

- **Mailcow**: All-in-one mail server
- **Microsoft Exchange**: Mail server for Windows
- **Postfix**: Mail server for Linux
- **Dovecot**: IMAP and POP3 server for Linux
- **Roundcube**: Webmail client
