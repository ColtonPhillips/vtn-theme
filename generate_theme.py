#!/usr/bin/env python
 
from random import choice

def main():
    with open('verbs.txt', 'r') as verbFile:
        verbs = verbFile.read().split()
    with open('nouns.txt', 'r') as nounFile:
        nouns = nounFile.read().split()

    for i in range(100):
        print '{verb} the {noun}'.format(verb=choice(verbs).title(), noun=choice(nouns).title())

if __name__ == "__main__":
    main()
