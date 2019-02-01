#%% Indexing
letters = ['a', 'b', 'c']
print(letters[1]) # prints out 'b'

#%% The perils of =

# Unexpected behaviour from a MATLAB perspective
x = [2, 4, 6, 8, 10] # define x
y = x                # try to copy x into y
x[2] = 99            # change 3rd value of x to 99
print(x) # prints out [2, 4, 99, 8, 10]
print(y) # prints out [2, 4, 99, 8, 10], oh no


# Actually make a copy this time
from copy import deepcopy
x = [2, 4, 6, 8, 10] # redefine x
y = deepcopy(x)      # actually copy x into y
x[2] = 99            # change 3rd value of x to 99
print(x) # prints out [2, 4, 99, 8, 10]
print(y) # prints out [2, 4,  6, 8, 10]

#%% Default/optional function arguments
def myfunc(x,y, z=3):
    return x + y + z

print(myfunc(5,6))      # prints out 14
print(myfunc(5,6,7))    # prints out 18
print(myfunc(5,6, z=7)) # as above
