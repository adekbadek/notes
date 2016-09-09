## Bits and bytes

- Single binary value (`0` or `1`) is a __bit__ (`b`).
- A group of 8 binary digits is a __byte__ (`B`)
- A nibble is half of a byte (4 bits))

A protocol of communication:
__Bitsize__ - how many bits are in a message.
__Bitrate__ - no. of bits transmitted each second.

8 bits can store up to 255 values.
16 bits can store up to 65536 values.

## Dates

Are stored as number of seconds from 00:00:00 UTC Jan 1 1970. We'll run out of bits on 03:14:07 UTC Jan 19 2038.

## Characters

__ASCII__ - basic set, letters, numbers, symbols.

__Unicode__ - newer standard that includes more characters.

__UTF-8__ - standard for the web: each char is represented by `U+`+four digit hex number

## Compression

Is generally about finding repeting patterns.
__Lossy__ = when decompressed, will not be exactly as original.

## Numbers

__Bitlength__ is how many bits are used to represent the number. If some of the bits are unused then they’re just set to 0 (left-pad).

__integers__, __floats__, __doubles__ - Floats and doubles use a decimal point (e.g. `1.9395`) but a float has a bitlength of 32, while a double has a bitlength of 64.

A __signed number__ is one that can be either negative or positive. Unsigned numbers are always assumed to be positive.

__Endian__ - means whether the number should be read from left to right or right to left. Big-endian - the digits on the left are “bigger”.
