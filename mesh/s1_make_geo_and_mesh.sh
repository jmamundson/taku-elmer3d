#!/bin/bash
# if test -f "taku.geo"; then
#    rm taku.geo
# fi 

# source activate glaciome
# python Contour2geo.py -r 200 -i outline/taku_outline.shp -o taku.geo # convert shape file into geo file
# conda deactivate

# Important: need to edit geo file manually so that the inflow boundary is separated from the rest of the boundary.

gmsh taku.geo -2

# ElmerGrid 14 2 mendenhall.msh -autoclean
# ElmerGrid 14 5 mendenhall.msh -autoclean

# To go parallel, use this:
ElmerGrid 14 2 taku.msh -autoclean -metis 4 0 # change first number to determine number of CPUs
ElmerGrid 14 5 taku.msh -autoclean


