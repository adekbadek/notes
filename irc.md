# IRC - Internet Relay Chat

## Basics

### Client

You

### Server

Connects clients together. You have to connect to a server to use IRC. A very popular one is `irc.freenode.net`

### Channel

Groups clients and relays all messages between them.

- If you join a non-existent channel, you create it and become it's __operator__
- a channel usually has a welcome message set (MOTD)

#### Operator

A client that has special powers in a channel. Can kick and ban other clients etc.

## Applications

There are many IRC applications, a popular CLI app is [irssi](https://irssi.org/)

run `$ irssi`, then:

- `/connect irc.freenode.net` to connect to a server
- `/nick funny_name` to set your nick (by default it will be the computer user's name).
- `/join super_channel` to join #super_channel. If there is no such channel, it will be created and the creator becomes it's operator (with an `@` in front of their nick).
- `/leave` to leave channel
- `/msg my_friend hello there` to begin private messaging with your friend, identified by a nick and connected to the same server

## Security

IRC is sending stuff in plaintext, so it's __not secure__. And client's IP is usually visible to everyone else (VPN to the rescue)

Even if encryption is used by one client, others may not use it, and server operators can keep logs.


--

sources:

http://www.livinginternet.com/r/r.htm
