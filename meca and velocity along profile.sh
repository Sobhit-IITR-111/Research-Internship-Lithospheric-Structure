# To plot meca data, extracting meca and velocity model data along the profiles

# beginning of GMT code frame
gmt begin png
# GMT code frame for figure 1
gmt figure pamir-beachball png
gmt basemap -R65/80/25/45 -JM15c -BWSen -Bxa5 -Baf
gmt grdimage pamir_dataset.grd -I -Cglobe
gmt colorbar -Dx0.5/-1.5+w14c/0.5c+e+h -Ba2000+l"Earth Relief(in m)"
# Plotting meca data on figure
gmt makecpt -Cred,yellow,green,blue -T0,20,40,80,400
gmt meca meca.txt -Sd0.5c+f0p+m -C
gmt colorbar -DjBR+o-1.5c/0c+w-10c+ml+e -Ba1000+l"Focal depth (km)"
gmt makecpt -Cred,yellow,green,blue -T0,20,40,80,400
gmt colorbar -DjBR+o-1.5c/0c+w-10c+ml+e -L -I 
# giving coordinates(lat,long) of Profiles and storing in respected files
echo 75 32 A1 > xsection1.txt
echo 68 41 B1 >> xsection1.txt
echo 72 26 A2 > xsection2.txt
echo 72 44 B2 >> xsection2.txt
# Marking Profiles
gmt plot xsection1.txt -W2p,red
gmt text xsection1.txt -F+f15p
gmt plot xsection2.txt -W2p,red
gmt text xsection2.txt -F+f15p
gmt plot Thrust_pamir.txt -W0.5p,black -i1,2 
gmt plot Rem_thrust.txt -W0.5p,black -i1,2 
# Adding String/text on the figure
while IFS= read -r line; do
    set -- $line
    lon=$1
    lat=$2
    text=$3
    fontsize=$4
    font=$5
    color=$6
    justification=$7
    angle=$8
    echo "$lon $lat $text" | gmt text -F+f${fontsize},${font},${color}+j${justification}+a${angle}
    done < fig_1b_texts.txt
# GMT code frame for figure 2
gmt figure xsections png
# Setting the configuration of Subplot
gmt subplot begin 2x1 -Fs15c/10c -M0.5c
# GMT code frame for 1 subplot
gmt subplot set 0,0
gmt basemap -JX15c/-10c -R0/1200/0/260 -BWSen -Bxaf+l"Distance(S-N) (km)" -Byaf+l"Depth (km)"
gmt makecpt -Cred,yellow,green,blue -T0,20,40,80,300
# plotting meca data
gmt coupe meca.txt -Sd0.5c+f0p -R0/1200/0/260 -Aa75/32/68/41/300+d90+w50 -C -Q -JX15c/-10c -BWSen -Bxaf+l"Distance(S-N) (km)" -Byaf+l"Depth (km)" 
# adding meca legend
gmt meca focal_leg.txt -Sa0.5c+m 
# GMT code frame for 2 subplot
gmt subplot set 1,0
gmt basemap -JX15c/-10c -R0/2000/0/260 -BWSen -Bxaf -Byaf+l"Depth (km)" 
gmt grdimage -R0/2000/0/260 Vp%_P2_+ve.grd -CHMSL-P06_percent_longitude.cpt -t20 
gmt makecpt -Cred,yellow,green,blue -T0,20,40,80,300
# plotting meca data
gmt coupe meca.txt -Sd0.5c+f0p -R0/2000/0/260 -Aa72/26/72/44/300+d90+w50 -C -Q -JX15c/-10c -BWSen -Bxaf -Byaf+l"Depth (km)" 
gmt colorbar -CHMSL-P06_percent_longitude.cpt -Dx15.5/1+w5c/0.3c+e -Bx+l"Vp%" -B0.5 -I 
gmt subplot end
# end of subplot
gmt end show
# end of GMT code frame
