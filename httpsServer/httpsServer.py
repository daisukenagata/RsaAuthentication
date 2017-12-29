import sys
import call

def callback_method(query):
    return [query]

if __name__ == '__main__':
    call.start(callback_method)

