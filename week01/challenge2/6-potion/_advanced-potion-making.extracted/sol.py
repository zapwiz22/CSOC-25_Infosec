def xor_decrypt(data, key):
    return bytes([b ^ key[i % len(key)] for i, b in enumerate(data)])


with open("5B", "rb") as f:
    data = f.read()

key = bytes.fromhex("EE121D")  # 3-byte key
decrypted = xor_decrypt(data, key)

print(decrypted.decode(errors="replace"))  # Try to decode as UTF-8, replacing junk
