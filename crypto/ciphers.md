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

## Bacon cipher

Groups of five binary symbols (`0` & `1`), each group encodes a character. E.g. [typefaces on a cryptographer's tombstone](https://nakedsecurity.sophos.com/2018/01/22/famous-cryptographers-tombstone-cryptogram-decrypted/).

# Stream Ciphers

Consistency equation: `D(k, E(k, m)) = m`
E is often randomized, D is always deterministic

One Time Pad is simply `k ⊕ m` (and `k = m ⊕ c`)
If a key is used more than once, then `c1 ⊕ c2 === m1 ⊕ m2`, and with that it can be analysed (Project Venona - USA decrypting USSR's two-time pads)

**Perfect secrecy** - means that the probability of getting a particular ciphertext is same for two different messages (of the same length) (a ciphertext cannot be linked to a particular message, so there is no ciphertext-only attack (e.g. frequency analysis on substitution cipher))
Shannon proved that for a cipher to have perfect secrecy, the # of keys must be >= # of messages (len. of the key must be >= len. of message). So perfect secrecy is impractical.

**Stream Ciphers**
*Pseudo-Random Generator* is a deterministic function that takes a seed sequence and outputs a much much larger sequence. the random thing is the seed.
The key is the seed, and message is XORed with the output of the PRG (which is >= the message - as in OTP). Security depends on the PRG - it must be unpredictable (output must be indistinguishable from random).

**malleability** (no integrity)
problem with OTP - modifications for ciphertext are undetected and have predictable impact on plaintext

**nonce**
a non-repeating value added to the key, so that the key can be reused (the key+nonce pair is used for encryption, and a particular pair is never used more than once)


---
sources
- https://www.coursera.org/learn/crypto
