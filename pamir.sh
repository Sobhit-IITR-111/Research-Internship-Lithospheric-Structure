# To make a subplot of depth-wise seismicity and symbolizing major magnitude events as star

# beginning of GMT code frame
gmt begin Pamir png
# loading earth relief grid file from device storage
t_d="earth_relief_02m.grd"
# Setting the configuration of Subplot
gmt subplot begin 2x2 -Fs15c/20c -M0.5c
# GMT code frame for 1 subplot
gmt subplot set 0,0
gmt basemap -R65/80/25/45 -Baf -Ba1 -JM 
gmt makecpt -Cgray45,gray35,gray25,gray15,gray10,gray5 -T0,5000,6000,7000,8000,9000,10000
gmt grdimage smoothed_pamir.grd  -I -C
gmt coast -B -W0.5p,grey35 -Slightblue
gmt plot Thrust_pamir.txt -W0.5p,black -i1,2 
gmt plot Rem_thrust.txt -W0.5p,black -i1,2 
# Plotting lower magnitude events M<6.5
gmt makecpt -Cred,yellow,green,blue -T0,20,40,80,900
gmt plot S_Pamir0-20.txt  -i1,0,2,3,4 -S -C -W0.4p,black 
# Plotting higher magnitude events M>6.5
gmt makecpt -Cgold -T0,900
gmt plot MS_Pamir0-20.txt  -i1,0,2,3,4 -S -C -W0.4p,black
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
    # GMT code frame for 2 subplot
gmt subplot set 0,1
gmt basemap -R65/80/25/45 -Baf -Ba1 -JM 
gmt makecpt -Cgray45,gray35,gray25,gray15,gray10,gray5 -T0,5000,6000,7000,8000,9000,10000
gmt grdimage smoothed_pamir.grd  -I -C
gmt coast -B -W0.5p,grey35 -Slightblue
gmt plot Thrust_pamir.txt -W0.5p,black -i1,2 
gmt plot Rem_thrust.txt -W0.5p,black -i1,2 
# Plotting lower magnitude events M<6.5
gmt makecpt -Cred,yellow,green,blue -T0,20,40,80,900
gmt plot S_Pamir20-40.txt -i1,0,2,3,4 -S -C -W0.4p,black
# Plotting higher magnitude events M>6.5
gmt makecpt -Cgold -T0,900
gmt plot MS_Pamir20-40.txt -i1,0,2,3,4 -S -C -W0.4p,black
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
    # GMT code frame for 3 subplot
gmt subplot set 1,0
gmt basemap -R65/80/25/45 -Baf -Ba1 -JM
gmt makecpt -Cgray45,gray35,gray25,gray15,gray10,gray5 -T0,5000,6000,7000,8000,9000,10000
gmt grdimage smoothed_pamir.grd  -I -C
gmt coast -B -W0.5p,grey35 -Slightblue
gmt plot Thrust_pamir.txt -W0.5p,black -i1,2 
gmt plot Rem_thrust.txt -W0.5p,black -i1,2 
# Plotting lower magnitude events M<6.5
gmt makecpt -Cred,yellow,green,blue -T0,20,40,80,900
gmt plot S_Pamir40-80.txt -i1,0,2,3,4 -S -C -W0.4p,black
# No higher magnitude events M>6.5
gmt makecpt -Cgold -T0,900
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
    # GMT code frame for 4 subplot
gmt subplot set 1,1
gmt basemap -R65/80/25/45 -Baf -Ba1  -JM 
gmt makecpt -Cgray45,gray35,gray25,gray15,gray10,gray5 -T0,5000,6000,7000,8000,9000,10000
gmt grdimage smoothed_pamir.grd  -I -C
gmt coast -B -W0.5p,grey35 -Slightblue
gmt plot Thrust_pamir.txt -W0.5p,black -i1,2 
gmt plot Rem_thrust.txt -W0.5p,black -i1,2 
# Plotting lower magnitude events M<6.5
gmt makecpt -Cred,yellow,green,blue -T0,20,40,80,900
gmt plot S_Pamir80-L.txt  -i1,0,2,3,4 -S -C  -W0.4p,black
# Plotting higher magnitude events M>6.5
gmt makecpt -Cgold -T0,900
gmt plot MS_Pamir80-L.txt -i1,0,2,3,4 -S -C -W0.4p,black
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
gmt subplot end
# end of subplot
gmt makecpt -Cred,yellow,green,blue -T0,20,40,80,400
gmt colorbar -Dx-2.5/15+w15c/0.8c+e -L -I -By+l"Focal Depth (in Km)"
# Setting Font Annotaions 
gmt set FONT_ANNOT_PRIMARY 16p,Helvetica,black
gmt legend legend_Pamir.txt -Dx-5.5/0+w5.5c/7c -F+pthick
gmt end show
# end of the GMT code frame