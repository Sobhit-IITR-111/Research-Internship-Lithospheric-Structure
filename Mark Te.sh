# To mark the Te values over the region 

# beginning of GMT code frame
gmt begin Te png
gmt basemap -R65/80/25/45 -Baf -Ba1 -JM15c
gmt grdimage BA_pamir_dataset.grd -I -CPALET_WGM_Bouguer_Global.cpt
gmt colorbar -CPALET_WGM_Bouguer_Global.cpt -Dx-3.5/1+w10c/0.5c+e -Bx+l"BA(in mgal)" -B50 -I -F+pthick
gmt plot Thrust_pamir.txt -W1p,black -i1,2 
gmt plot Rem_thrust.txt -W1p,black -i1,2 
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
    echo "68 31.5" >  rectangle.txt
    echo "75 31.5" >> rectangle.txt
    echo "75 41.5" >> rectangle.txt
    echo "68 41.5" >> rectangle.txt
    echo "68 31.5" >> rectangle.txt  # Close the rectangle

    # Plot the rectangle
    gmt plot rectangle.txt -W2p,white
    echo "68 33.5" >  L1.txt
    echo "75 33.5" >> L1.txt
    echo "68 35.5" >  L2.txt
    echo "75 35.5" >> L2.txt
    echo "68 37.5" >  L3.txt
    echo "75 37.5" >> L3.txt
    echo "68 39.5" >  L4.txt
    echo "75 39.5" >> L4.txt

    gmt plot L1.txt -W2p,white
    gmt plot L2.txt -W2p,white
    gmt plot L3.txt -W2p,white
    gmt plot L4.txt -W2p,white
    # Marking Profiles
    gmt plot xsection1.txt -W2p,red
    gmt text xsection1.txt -F+f15p
    gmt plot xsection2.txt -W2p,red
    gmt text xsection2.txt -F+f15p
    # Marking Te values on the figure
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
    done < Te_text.txt
gmt end show
# end of the GMT code frame
