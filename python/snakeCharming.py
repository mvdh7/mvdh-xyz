# Import numpy, and savemat function from scipy
import numpy as np
from scipy.io import savemat

# Create some variables
xvec = np.linspace(0, 10, 100)
yvec = 2*np.sqrt(xvec) + xvec + 3 + np.random.normal(size=np.size(xvec))

pasta = ['spaghetti', 'fusilli', 'orzo', 'penne']

# Save variables to .mat file
savemat('../data/snakeCharming.mat',
        {'x': xvec,
         'y': yvec,
         'pasta': pasta})

#%% Find my Python executable
from sys import executable

# Print it out for copy and paste:
print(executable)

# Or just save it to a .mat file:
savemat('../data/pyexe.mat',
        {'pyexe': executable})
