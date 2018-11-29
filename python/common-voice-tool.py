import sys
filename = sys.argv[1]

with open(filename, 'r') as f:
    out = ""
    for s in f:
        words = s.split()
        if words == []:
            continue
        words[0] = words[0].capitalize()
        treated = (" ".join(words))
        if treated[-1] != ".":
            treated += "."
        elif treated[-2] == ' ':
            treated = treated[:len(treated)-2] + '.'
        treated += "\n"
        out += treated
    with open('out.txt', 'w') as o:
        o.write(out)
    
    print("Formatted! Checking line lengths...")

correct = True

with open('out.txt', 'r') as final:
    for idx, line in enumerate(final):
        if len(line) > 126:     #one more cause lf is included
            print("Sentence too long at line " + str(idx + 1))
            correct = False
            print(line)

if correct:
    print("Everything should be fine now! Sentences in the right format are in out.txt (your original file hasn't been touched).")
else:
    print("Please fix the aforementioned issues!")