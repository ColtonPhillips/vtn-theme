from random import choice

def main():
    with open('verbs.txt', 'r') as verbFile:
        verbs = [verb.rstrip('\r\n') for verb in verbFile.readlines()]

    with open('nouns.txt', 'r') as nounFile:
        nouns = [noun.rstrip('\r\n') for noun in nounFile.readlines()]

    for i in range(100):
        print '{verb} the {noun}'.format(verb=choice(verbs).title(), noun=choice(nouns).title())

if __name__ == "__main__":
    main()
