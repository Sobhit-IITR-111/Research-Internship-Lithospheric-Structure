# To plot seismicity, marking Profile direction, marking Reciever function location

# beginning of GMT code frame
gmt begin RF png
gmt basemap -R65/80/25/45 -Baf -Ba1  -JM15c
gmt makecpt -Cgray45,gray35,gray25,gray15,gray10,gray5 -T0,5000,6000,7000,8000,9000,10000
gmt grdimage smoothed_pamir.grd  -I -C
gmt coast -B -W0.5p,grey35 -Slightblue
gmt plot Thrust_pamir.txt -W0.5p,black -i1,2
gmt plot Rem_thrust.txt -W0.5p,black -i1,2 
# plotting all seismicity 
gmt makecpt -Cred,yellow,green,blue -T0,20,40,80,400
gmt plot S_Pamir40-80.txt -i1,0,2,3,4 -S -C -W0.4p,black

gmt makecpt -Cred,yellow,green,blue -T0,20,40,80,900
gmt plot S_Pamir20-40.txt -i1,0,2,3,4 -S -C -W0.4p,black

gmt makecpt -Cgold -T0,900
gmt plot MS_Pamir20-40.txt -i1,0,2,3,4 -S -C -W0.4p,black

gmt makecpt -Cred,yellow,green,blue -T0,20,40,80,900
gmt plot S_Pamir80-L.txt  -i1,0,2,3,4 -S -C  -W0.4p,black

gmt makecpt -Cgold -T0,900
gmt plot MS_Pamir80-L.txt -i1,0,2,3,4 -S -C -W0.4p,black

gmt makecpt -Cred,yellow,green,blue -T0,20,40,80,900
gmt plot S_Pamir0-20.txt  -i1,0,2,3,4 -S -C -W0.4p,black 

gmt makecpt -Cgold -T0,900
gmt plot MS_Pamir0-20.txt  -i1,0,2,3,4 -S -C -W0.4p,black

gmt makecpt -Cred,yellow,green,blue -T0,20,40,80,900
gmt colorbar -Dx-3/5+w15c/0.5c+e -L -I -By+l"Focal Depth(in Km)"
gmt legend legend_Pamir.txt -Dx-5.5/0+w4c/4c -F+pthick 
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
    # Marking Profiles
gmt plot xsection1.txt -W2p,red
gmt text xsection1.txt -F+f15p
gmt plot xsection2.txt -W2p,red
gmt text xsection2.txt -F+f15p
# plotting Reciever function Location
gmt plot Combined_RF.txt -St0.4c -Gblack
gmt end show
# end of the GMT code frame