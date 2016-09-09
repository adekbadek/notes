# Ciphers

## ROT13

Symmetric Caesar (because it's two way - 16/2=13)

## Vigenère cipher

Each character in the key represents a Ceasar cipher transposition. If the message is longer than the key, the key repeats.

`HELLO` encrypted with key `BIT`

H | E | L | L | O
--- | --- | --- | --- | ---
B | I | T | B | I
I | M | E | M | W

> The primary weakness of the Vigenère cipher is the repeating nature of its key. If a cryptanalyst correctly guesses the key's length, then the cipher text can be treated as interwoven Caesar ciphers, which individually are easily broken. The Kasiski examination and Friedman test can help determine the key length.
