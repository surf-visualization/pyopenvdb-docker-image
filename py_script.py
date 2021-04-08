
import pyopenvdb as vdb

print("Hoi from python")

grid = vdb.FloatGrid()
grid.fill(min=(0,0,0), max=(1,1,1), value=0.5)
grid.convertToPolygons(0.5)

print(grid)