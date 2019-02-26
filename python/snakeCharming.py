# Import numpy, and savemat function from scipy
import numpy as np
from scipy.io import savemat

# Create some variables
xvec = np.linspace(0,10,100)
yvec = 2*np.sqrt(xvec) + xvec + 3 + np.random.normal(size=np.size(xvec))

pasta = ['spaghetti', 'fusilli', 'orzo', 'penne']

# Save variables to .mat file
savemat('../data/snakeCharming.mat',
        {'x': xvec,
         'y': yvec,
         'pasta': pasta})
