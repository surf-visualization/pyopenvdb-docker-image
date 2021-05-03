import pyopenvdb as vdb
import numpy

# Generate a random array of floats
array = numpy.random.rand(50, 50, 50) 

# Copy values from a three-dimensional array of doubles
# into a grid of floats.
grid = vdb.FloatGrid()
print('Copying')
grid.copyFromArray(array)
assert grid.activeVoxelCount() == array.size
print(grid.evalActiveVoxelBoundingBox())
grid.name = 'float'

# Write to VDB file
vdb.write('floats.vdb', grids=[grid])
