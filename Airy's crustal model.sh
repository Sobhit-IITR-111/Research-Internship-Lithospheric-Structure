# To compute the Airy crustal model using the topography data

# beginning of GMT code frame
gmt begin FAA png
gmt basemap -R65/80/25/45 -Baf -Ba1 -JM15c
gmt makecpt -Cjet -T35/60/5
#pm(density of mantle)=3.30gm/cc pc(density of crust)=2.67gm/cc, average crustal thickness(t)=35km and K=(pc/pm-pc) which is =4.238095
K=4.238095
t=35
# computing the Airy's root created by excess mass loading on surface
gmt grdmath smoothed_150.grd $K MUL = roots.grd 
# converting into kilometers
gmt grdmath roots.grd 0.001 MUL = roots.grd 
# adding average crustal thickness to root to give the Airy's crustal thickness model
gmt grdmath roots.grd $t ADD = crustal_thick.grd
# plotting the computed Airy's crustal model
gmt grdimage crustal_thick.grd -I -C
gmt colorbar -Dx-3.5/1+w10c/0.5c+e -Bx+l"Crustal Thickness(in km)" -B5 -I -F+pthick
gmt grdcontour smoothed_150.grd -C200 -A600 -Wcthinnest,red -Wathin,black 
gmt end show
# end of GMT code frame
