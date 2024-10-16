# To compare all types of gravity anomaly for crustal Isostasy study

# beginning of GMT code frame
gmt begin gravity_data png
# Setting the configuration of Subplot
gmt subplot begin 2x2 -Fs15c/15c -M1c 
# GMT code frame for 1 subplot
gmt subplot set 0,0 
gmt basemap -R65/80/25/45 -Baf -Ba1 -JM 
gmt makecpt -Cjet -T35/60/5
gmt grdimage crustal_thick.grd -I -C
gmt colorbar -Dx-3.5/1+w10c/0.5c+e -Bx+l"Crustal Thickness(in Kms)" -B5 -I -F+pthick
gmt grdcontour smoothed_150.grd -C200 -A600 -Wcthinnest,red -Wathin,black
# GMT code frame for 2 subplot
gmt subplot set 0,1
gmt basemap -R65/80/25/45 -Baf -Ba1 -JM 
gmt grdimage FAA_pamir_0.5.grd -I -CPALET_WGM_Freeair_Global.cpt
gmt colorbar -CPALET_WGM_Freeair_Global.cpt -Dx-3.5/1+w10c/0.5c+e -Bx+l"FAA(in mgal)" -B50 -I -F+pthick
gmt plot Thrust_pamir.txt -W1p,black -i1,2
gmt plot Rem_thrust.txt -W0.5p,black -i1,2 
# GMT code frame for 3 subplot
gmt subplot set 1,0
gmt basemap -R65/80/25/45 -Baf -Ba1 -JM
gmt grdimage BA_pamir_dataset.grd -I -CPALET_WGM_Bouguer_Global.cpt
gmt colorbar -CPALET_WGM_Bouguer_Global.cpt -Dx-3.5/1+w10c/0.5c+e -Bx+l"BA(in mgal)" -B50 -I -F+pthick
gmt grdcontour crust_model_comp.grd -C5 -A5+f13p -Wa1p,black
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
    done < Hindu-Kush_text.txt
# GMT code frame for 4 subplot
gmt subplot set 1,1
gmt basemap -R65/80/25/45 -Baf -Ba1 -JM
gmt grdimage IA_pamir_0.5.grd -I -CPALET_WGM_Isostatic_Global.cpt
gmt colorbar -CPALET_WGM_Isostatic_Global.cpt -Dx-3.5/1+w10c/0.5c+e -Bx+l"IBA(in mgal)" -B50 -I -F+pthick
gmt subplot end
# end of the subplot
gmt end show 
# end of the GMT code frame
