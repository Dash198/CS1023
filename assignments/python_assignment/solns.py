# Problem 1

def no_moves(n):
    if n==1:            # Base case: n==1
        return 0
    elif n%2==0:
        n/=2            # Even case
    else:
        n = 3*n + 1     # Odd case
    
    return 1 + no_moves(n)      # Recursive call

# Problem 2

def reverse_line(in_file):

    f = open(in_file,'r')       # Open the file
    in_lines = f.readlines()        # Store lines into a list
    in_file = in_file.split('.')            
    out_file = in_file[0] + "_op" + in_file[1]      # Define the output file name
    fo = open(out_file, 'w')
    for line in in_lines:           # Split each line into words and reverse each word (to prevent \n from being in line)
        newline = ""
        words = line.split()
        
        for word in words[::-1]:
            newline += word[::-1] + " "
        
        newline += "\n"

        fo.write(newline)
    
    f.close()
    fo.close()      

# Problem 3

def wordcount(file):

    f = open(file, 'r')     # Open the arg file
    unique_words = set()
    line_count = 0
    word_count = 0
    char_count = 0

    lines = f.readlines()
    line_count = len(lines)     # Put all lines into an array, line count is length of the array
    
    for line in lines:
        char_count += len(line)     # Count chars as length of each line
        words = line.split()

        word_count += len(words)        # Word count by splitting the line into word array
        for word in words:
            unique_words.add(word)      # Set to find unique words
        
    print("No. of characters:",char_count)
    print("No. of words:",word_count)
    print("No. of lines:",line_count)
    print("No. of unique words:",len(unique_words))

# Problem 4

def dictdiff(dict1, dict2):

    keys1 = list(dict1.keys())      # List of ict1 keys
    keys2 = list(dict2.keys())      # Same for dict2
    keys = list(set(keys1 + keys2))     # Store all the unique keys

    fdict = {}
    for key in keys:        # Check for existence of elements in both dictionaries with the given key

        if key in keys1:
            e1 = dict1[key]
        else:
            e1 = None
        
        if key in keys2:
            e2 = dict2[key]
        else:
            e2 = None

        if e1 == e2:        # Omit if the same element exists in both dicts
            continue
        else:
            fdict[key] = [e1,e2]

        
    return fdict

# Problem 5

def alphabetize_names(PEOPLE):
    new_dict = sorted(PEOPLE, key=lambda person:(person['last'],person['first']))       # Function to sort dictionaries by key
    return new_dict                                                                     # First checks last name and then first.

# Problem 6

def highest_freq(word):             # function to find frequency of highest occuring character
    freqs = [0] * 26
    for c in word:
        freqs[ord(c) - 97] += 1
    
    return max(freqs)

def most_repeating_word(words):
    mr_word = words[0]
    best_freq = highest_freq(mr_word)       # Start by assuming first word as MR word, compare one by one

    for word in words:
        if best_freq <= highest_freq(word):
            mr_word = word
            best_freq = highest_freq(word)
        
    return mr_word

# Problem 7

def format_sort_records(recordList):

    outstr = ""
    for (x,y,z) in recordList:
        outstr +=   y + " " + x + " " + str(z) + "\n\n"     # Pattern match and print

    return outstr

# Problem 8

def passwd_to_dict(filename):
    f = open(filename,'r')
    records = f.readlines()     # Store a list of all the lines
    pwd = {}
    for line in records:
        values = line.split(':')        # Split the line and extract the strings at index 0 and 2
        usrname = values[0]
        id = int(values[2])             # Store the id as int
        pwd[usrname] = id

    return pwd

# Problem 9

gematria_score = {chr(i+96):i for i in range(1,27)}     # Reference dictionary

def gematria_for(word):
    score = 0
    valid_chars = gematria_score.keys()       
    for char in word:
        if char in valid_chars:     # Check if the character is a lowercase alphabet
            score += gematria_score[char]

    return score

def gematria_equal_words(word, wordList):    
    expScore = gematria_for(word)
    matching = []

    for w in wordList:
        if gematria_for(w) == expScore:     # If scores match, add the word to the list
            matching.append(w)

    return matching


# Problem 10
import random
def create_password_generator(sample_space):
    def create_pwd(length):
        pwd=""
        sample_space_length = len(sample_space)
        for i in range(length):
            index = random.randint(0,sample_space_length-1)     # Generate a random index to use and add to the pwd string
            pwd += sample_space[index]

        return pwd

    return create_pwd


# Problem 11

class Circle:

    def __init__(self, str, n):
        self.out = ""
        x = len(str)
        for i in range(n):
            self.out += str[i%x] + " "          # Store the circular string as a variable
        
        print(self.out)                 # Printing it as well (question is sort of vague)


# Problem 12

class Animal:                               # Animal class

    def __init__(self, name, color, legs):
        self.name = name
        self.color = color
        self.legs = legs

class Cage:                             # Cage Class
    def __init__(self, id, anims):
        self.id = id
        self.animals = anims
        pass

class ZooManager:                       # Zoo Mgr class with all the functions

    def __init__(self):
        self.cages = {}
    
    def add_new_animal_to_cage(self, id, animal):
        if id in self.cages.keys():
            self.cages[id].animals.append(animal)
        
        else:
            self.cages[id] = Cage(id,[animal])

    def add_multiple_animals_to_cage(self,id,animals):
        if id in self.cages.keys():
            self.cages[id].animals.extend(animals)
        
        else:
            self.cages[id] = Cage(id,animals)

    def filter_animals_by_color(self,color):
        animals = []
        for id in self.cages.keys():
            for animal in self.cages[id].animals:
                if animal.color == color:
                    animals.append(animal)

        return animals
    
    def filter_animals_by_legs(self, legs):
        animals = []
        for id in self.cages.keys():
            for animal in self.cages[id].animals:
                if animal.legs == legs:
                    animals.append(animal)

        return animals  
    

    def calculate_total_legs(self):
        total_legs = 0
        for id in self.cages.keys():
            for animal in self.cages[id].animals:
                total_legs += animal.legs

        return total_legs
    

# Problem 13

import math

def gen_pi(n):

    if n>10 :
        print("Error: Maximum decimal limit of 10 exceeded!")
        return None
    else:
        return round(math.pi,n)         # Only return the rounded value of pi if the no of decimal places is <10
    
# Problem 14

def longest_substring_with_atmost_two_unique_chars(s):
    x = len(s)

    length = x
    while length>0:                     # Start with the longest length
        for sindex in range(x-length+1):            # Iterate through all possible starting indices
            freqs = [0]*26
            for index in range(sindex, sindex + length):        
                freqs[ord(s[index])-97] = 1
            
            if sum(freqs) <= 2:         # Total appearances of all characters must be <=2
                print(length, s[sindex:sindex+length])
                return
        
        length -= 1

# Problem 15

def longest_sublist_of_consective_ints(lst):
    lst.sort()      # Sort the list so that any possible consecutive numbers are grouped together

    x = len(lst)
    length = x
    while length>0:             # Same logic, start with the largest length and check for any sublists that satisfy, return the first
        for sindex in range(x-length+1):
            no_consecs = 0
            slst = lst[sindex:sindex+length]
            diff = slst[0]
            for i in range(length):
                if slst[i] - i != diff:
                    break

                no_consecs+=1
            if no_consecs == length:
                return slst
        
        length-=1
