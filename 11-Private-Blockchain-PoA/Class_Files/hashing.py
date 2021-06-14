import hashlib

# output sha256 hash in hexadecimal string format
def hash(message):
    return hashlib.sha256(message).hexdigest()


# modify these messages
# note: we include the "b" before the string definition in order to represent it as bytes instead of a string
message_one = b"I am authorizing the transfer of $500 to Harold"

message_two = b"I am authorizing the transfer of $5000 to Harold"

# print both messages and their corresponding hashes
print(message_one, hash(message_one))
print(message_two, hash(message_two))

# compare the hashes in an if statement

hash_one = hash(message_one)

hash_two = hash(message_two)

if hash_one == hash_two:
    print("Hashes are equal")
else:
    print("Hashes are not equal")

# compare the length of the hashes

print("Length of hash one:", len(hash_one))
print("Length of hash two:", len(hash_two))
