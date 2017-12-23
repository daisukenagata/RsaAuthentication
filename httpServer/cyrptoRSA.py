from Crypto.PublicKey import RSA
from Crypto import Random
import requests

def start_Key(keySet):
    
    random_generator = Random.new().read
    key = RSA.generate(2048, random_generator)

    public = key.publickey()
    private = key.exportKey()

    enc_data = public.encrypt('password'.encode('utf-8'), 32)
    print(keySet)
    if (keySet == b'password'):

        return key.decrypt(enc_data).decode('utf-8')
    
    else:

        return "again"
