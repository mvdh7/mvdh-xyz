#%% Accessing rows and columns
import numpy as np
x = np.array([[1, 2, 3], [4, 5, 6]])
print(x[1])   # prints out the second row i.e. [4, 5, 6]
print(x[1,:]) # works just like the previous one
print(x[:,1]) # prints out the second column i.e. [[2], [5]]
#print(x[:,1,:,:]) # are you mad?

#%% Matrix maths
A = np.array([[1, 2], [3, 4]])
b = np.array([[9], [10]])
C = A @ b # returns [[29], [67]]
v = A * b # returns [[9, 18], [30, 40]]

#%% Shape and size
# x defined in earlier example
print(np.size (x)) # returns 6
print(np.shape(x)) # returns (2, 3)

#%% Sequences
print(np.arange(0,10,2)) # [0, 2, 4, 6, 8]

#%% Fitting

# Simulate some data to fit
t = np.arange(1,11,1)
n = t*2 + 1 + np.random.normal(size=np.size(t))

# Import least-squares fitting function
from scipy.optimize import least_squares

# Do the fit, defining the fitting function in-line
fitresult = least_squares(
    lambda coeffs: t*coeffs[0] + coeffs[1] - n, [0,0])

# Show the coefficient values
print(fitresult['x'])

#%% In-line function definition
ilfunc = lambda var: var * 2
print(ilfunc(3)) # returns 3 * 2 = 6
