# Positional Notation

We probably use base10 simply because we have 10 fingers

Base >10 systems are called __alfanumeric__ (using letters after running out of digits).

## base2 (binary)

symbols: `0` and `1`

Each new digit has a value two times greater than the digit to its right

so `10011011` = `1*128 + 0 + 0 + 1*16 + 1*8 + 0 + 1*2 + 1*1` = `155`

## base16 (hex, hexadecimal)

symbols: `0-9` and letters `a-f` for `10-15`

Each hexadecimal symbol represents four binary digits (bits), and the primary use of hexadecimal notation is a human-friendly representation of binary-coded values

> In Unix and C, prefixed with `0x` (e.g. `0x2af3`). A byte value is in range 0-255 in decimal, and 00-ff in hex.

## base64

symbols: `A-Z`, `a-z`, `0-9`, `+`, `/`

> Encoding scheme used to represent __binary__ data in an __ASCII__ format, e.g. to turn images into text.

> Base64 is not encryption or compression (opposite - ~30% larger files), just encoding.
