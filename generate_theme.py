from random import choice

def main():
    verbs, nouns = [], []
    with open("verbs.txt",'r') as verb_file:
        for line in verb_file:
            verbs.append(line.rstrip('\r\n'))

    with open("nouns.txt",'r') as noun_file:
        for line in noun_file:
            nouns.append(line.rstrip('\r\n'))

    for i in range(100):
        print choice(verbs).title() + " the " + choice(nouns).title()

if __name__ == "__main__":
    main()
