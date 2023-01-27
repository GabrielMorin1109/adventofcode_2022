#!/usr/bin/env python
#%%
def day1():
    # Change directory to read the datafile
    import os
    script_path = os.path.abspath(__file__) # extract the complete path of the open file
    script_dir = os.path.dirname(script_path) # extract the complete path of the FOLDER open file
    os.chdir(script_dir) # change dir
    import pandas as pd
    dd = pd.read_csv('input.txt', header=None, names = ["Elf"], skip_blank_lines=False)
    dd["Grp"] = dd.isnull().cumsum() # Create a group column exploiting the rows with NA
    dd_csum = dd.groupby('Grp').sum() # cumsum over group
    dd_nl = dd_csum.nlargest(3, 'Elf') # partial sorting of the 3 largest (R give the 3 smallest)
    return {'sol1' : dd_nl.iloc[0], 'sol2' : dd_nl.sum()}

#%%
import timeit
%timeit day1()
# SOLUTION 1 : 67027
# SOLUTION 2 : 197291
