#!/usr/bin/env python
#%% Chg directory
import os, re
script_path = os.path.abspath(__file__) # extract the complete path of the open file
script_dir = os.path.dirname(script_path) # extract the complete path of the FOLDER open file
os.chdir(script_dir) # change dir
os.getcwd()
# %% read data
file_pointer = open("Data/input.txt",mode= "r" )
tmp = file_pointer.read().strip().split("\n")
dd_tmp = list(map(lambda num: num.split(","), tmp))

# %% Part 1 : 
dd = list(map(lambda x: re.split(pattern = '-|,',string = x), tmp))
def within(x): 
    """
    y : convert list of string to int
    Structure: 2 coordinates (a,b) & (c,d).
    first_test = if (a <= c) & (b >= d) is True then (a,b) include (c,d)
    second_test = if (a >= c) & (b <= d) is True then (c,d) include (a,b)
    first_test OR second_test is True, then one of the two interval include the other
    """
    y = [int(i) for i in x]
    first_test = (y[0] <= y[2]) & (y[1] >= y[3])
    second_test = (y[0] >= y[2]) & (y[1] <= y[3])
    return first_test | second_test
# List of True/False
dd_within = [within(ddi) for ddi in dd]

# Part 1 :
dd_within.count(True) # 550

# %% Part 2:
def intersept(x):
    """
    y : convert list of string to int
    Structure: 2 coordinates (a,b) & (c,d).
    first_test  = if min(a,b) <= max(c,d)
    second_test  = if max(a,b) >= min(c,d)
    if first_test OR second_test is True, the one intersept with the other.
    """
    y = [int(i) for i in x]
    ab_max = max(y[0],y[1])
    ab_min = min(y[0],y[1])
    cd_min = min(y[2],y[3])
    cd_max = max(y[2],y[3])
    first_test = ab_min <= cd_max
    second_test = ab_max >= cd_min
    return first_test & second_test
# List of True/False
dd_intersept = [intersept(ddi) for ddi in dd]

# Part 2 :
dd_intersept.count(True) # 931