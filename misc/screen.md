# screen

`screen` is a program that lets you run detached processes on unix.

e.g. log into a VPS, start a server, then safely exit the connection while leaving the server running.

## how to

  - `$ screen`, then run the process (e.g. `$ node server.js`)
  - click `Ctrl+A+D` to detach the session
  - `$ screen -ls` to list running sessions along with their id's
  - `$ screen -r [session id]` to get back to a session
  - `$ screen -X -S [session id] quit` to quit a session
