#!/bin/bash
# 1. Merges two ArcticDEM tiles.
# 2. Warps and crops the merged DEM.
# 3. Fills a few DEM holes at high elevation.

xmin=544975
xmax=560275
ymin=6473575
ymax=6496875

if test -f "taku_surface.tif"; then
    rm taku_surface.tif
fi

gdal_merge.py ./ArcticDEM_v3/40_05_10m_v3.0_reg_dem.tif ArcticDEM_v3/40_06_10m_v3.0_reg_dem.tif -o merged.tif # merge two ArcticDEM tiles
gdalwarp -t_srs epsg:32608 -te $xmin $ymin $xmax $ymax -tr 50 50 -dstnodata 0 merged.tif utm.tif # crop and reproject
gdal_fillnodata.py utm.tif ./taku_surface.tif

rm merged.tif
rm utm.tif
