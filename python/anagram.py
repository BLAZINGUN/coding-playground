a1 = "elbow"
a2 = "below"

if len(a1) == len(a2):

    a1_sorted = sorted(a1)
    a2_sorted = sorted(a2)

    if a1_sorted == a2_sorted:
        print("the string is an anagram")
    else :
        print("the string is not an anagram")