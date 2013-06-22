#!/usr/bin/env python
 
from random import choice

def main():
    verbs = open('verbs.txt').read().split()
    nouns = open('nouns.txt').read().split()
    for i in range(100):
        print '{verb} the {noun}'.format(verb=choice(verbs).title(), noun=choice(nouns).title())

if __name__ == "__main__":
    main()
