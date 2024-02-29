#!/bin/bash
# first run conda activate glaciome to use an environment that has shapefile installed
# once start making physical lines and surface, the numbering matters
if test -f "taku.geo"; then
    rm taku.geo
fi 

source activate glaciome
python Contour2geo.py -r 500 -i outline/taku_outline.shp -o taku.geo # convert shape file into geo file
conda deactivate

gmsh taku.geo -2

# need to edit mesh since we one the upper boundary to have a different boundary condition than the rest of the outline

# ElmerGrid 14 2 mendenhall.msh -autoclean
# ElmerGrid 14 5 mendenhall.msh -autoclean

# To go parallel, use this:
ElmerGrid 14 2 taku.msh -autoclean -metis 4 0 # change first number to determine number of CPUs
ElmerGrid 14 5 taku.msh -autoclean


