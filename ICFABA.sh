# To calculate the Isostatically compensated Bouguer anomaly

# beginning of GMT code frame
gmt begin ICFABA png
# Setting the configuration of Subplot
gmt subplot begin 4x1 -Fs10c/1.5c -M1c
# To extract the topography data along the Profile 2 
gmt grdtrack Profile2.txt -Gpamir_dataset.grd  > pamir_dataset_P2.txt
# GMT code frame for 1 subplot
gmt subplot set 0,0
gmt set MAP_FRAME_TYPE plain
gmt plot pamir_dataset_P2.txt -i1,3s0.001 -R25/45/0/6 -W0.5p,brown -Bxa5 -Bya2+l"Elevation(in Kms)"

# GMT code frame for 2 subplot
gmt subplot set 1,0
gmt set MAP_FRAME_TYPE plain
gmt plot FAA_pamir_dataset_P2.txt -i1,3 -R25/45/-250/450 -W0.5p,red -Bxa5 -Bya150+l"FAA(in mgal)"

# GMT code frame for 3 subplot
gmt subplot set 2,0
gmt set MAP_FRAME_TYPE plain
gmt plot BA_pamir_dataset_P2.txt -i1,3 -R25/45/-400/300 -W0.5p,blue -Bxa5 -Bya150+l"BA(in mgal)"

# GMT code frame for 4 subplot
gmt subplot set 3,0
gmt set MAP_FRAME_TYPE plain
gmt plot ICBA_P2.txt -i1,2 -R25/45/-400/300 -W0.5p,blue -Bxa5 -Bya150+l"ICBA(in mgal)"

gmt subplot end
# end of the subplot
gmt end show
# end of the GMT code frame