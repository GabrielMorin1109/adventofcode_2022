#!/usr/bin/env python
#%%
dd = open("Data/input.txt").read()
def marker_v2(n):
    j=n-1
    chr_seq = dd[0:(n-1)] # read the first n character
    while True:
        next_chr = dd[j] # read next character
        j+=1 # add 1 to the increment 
        chr_seq += next_chr # add character to the sequence
        # set return unique values from a list to a tuple. 
        # If the tuple is of len n, then we have n unique values
        # if no match, go to the next character
        if len(set(chr_seq)) == n : # to not have Inf loop
            return j
        # remove the last character
        chr_seq = chr_seq[1:]
# %%
dd = open("Data/input.txt").read()
def marker(n):
    j=n-1
    chr_seq = dd[0:(n-1)] # read the first n character
    next_bool = True # to start the while loop 
    while next_bool:
        next_chr = dd[j] # read next character
        j+=1 # add 1 to the increment 
        chr_seq += next_chr # add character to the sequence

        # set return unique values from a list to a tuple. 
        # If the tuple is of len n, then we have n unique values
        # if no match, go to the next character
        next_bool = not len(set(chr_seq)) == n 
        # remove the last character
        chr_seq = chr_seq[1:]
        if j >= len(dd): # to not have Inf loop
            break
    return j
# %%
{'sol1' : marker(4), 'sol2' : marker(14) } # {'sol1': 1766, 'sol2': 2383}