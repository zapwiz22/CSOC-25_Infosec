import hashlib

TARGET_HASH = "db6acda47b04b28c0a2abb47336c904daddca2f8fed075a64eac5e68832eba31"
SALT = "1750186525"  # Epoch timestamp used as salt
WORDLIST_PATH = "rockyou.txt"


def crack_sha256_with_salt(target_hash, salt, wordlist_path):
    try:
        with open(wordlist_path, "r", encoding="utf-8", errors="ignore") as f:
            for line_num, password in enumerate(f, 1):
                password = password.strip()
                candidate = password + salt
                hashed = hashlib.sha256(candidate.encode()).hexdigest()

                if hashed == target_hash:
                    print(f"[✔] Password found: {password}")
                    return password
        print("[-] Password not found in wordlist.")
        return None
    except FileNotFoundError:
        print(f"[!] Wordlist file '{wordlist_path}' not found.")
        return None


if __name__ == "__main__":
    crack_sha256_with_salt(TARGET_HASH, SALT, WORDLIST_PATH)
