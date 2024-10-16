# To plot topography, Thrust/fault system, Seismicity

# loading fault system files into data_file array
data_file=("Line1.txt" "Line2.txt" "Line3.txt" "Line4.txt" "Line5.txt" "Line6.txt" "Line7.txt" "Line8.txt" "Line9.txt" "Line10.txt" "Line11.txt" "Line12.txt" "Line13.txt" "Line14.txt" "Line15.txt" "Line16.txt" "Line17.txt" "Line18.txt" "Line19.txt" "Line20.txt" "Line21.txt" "Line22.txt" "Line23.txt" "Line24.txt" "Line25.txt" "Line26.txt" "Line27.txt" "Line28.txt" "Line29.txt" "Line30.txt" "Line31.txt" "Line32.txt" "Line33.txt" "Line34.txt" "Line35.txt" "Line36.txt" "Line37.txt" "Line38.txt" "Line39.txt" "Line40.txt" "Line41.txt" "Line42.txt" "Line43.txt")
# beginning of GMT code frame
gmt begin NH png
# loading earth relief grid file from device storage
    t_d="earth_relief_02m.grd"
    # creating basemap
    gmt basemap -R67/100/25/40 -Baf -Ba1 -JM25c 
    # plotting earth relief grid file on basemap using topo as color pallet
    gmt grdimage earth_relief_02m.grd -Ctopo -I 
    # marking coast and shading sea as lightblue
    gmt coast -B -W0.5p,grey35 -Slightblue 
    # adding colorbar for topo color pallet 
    gmt colorbar -Dx4/-1.5+w15c/0.5c+e+h -Bx+l"Topography(in m)" -B1000 -I -F+pthick
    # plotting each element file of an array data_file using for loop
    for d in "${data_file[@]}"; do
    gmt plot $d -W1p,black
    done
    # creating custom CPT for varying interval of hypocentre
    gmt makecpt -Cred,magenta,orange,yellow,green,blue -T0,20,40,60,80,100,900
    # marking seismic events with varying size(Magnitude) and varying color(Hypocentre)
    gmt plot S-3.5-4.5_0.1.txt -i0,1,2,3s0.5 -Sc -C
    gmt plot S-4.5-5.5_0.2.txt -i0,1,2,3s0.5 -Sc -C
    gmt plot S-5.5-6.5_0.3.txt -i0,1,2,3s0.6 -Sc -C
    gmt plot S-6.5-L_0.45.txt  -i0,1,2,3s0.8 -Sc -C  
    gmt colorbar -Dx-3/5+w7c/0.5c+e -L -I  -By+l"Focal Depth(in Kms)" 
    # creating legend box for Seismicity
    gmt legend legend.txt -Dx-5.5/0+w4c/4c -F+pthick -C0.1c/0.1c 
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
    done < texts.txt
    
gmt end show
# end of the GMT code frame
