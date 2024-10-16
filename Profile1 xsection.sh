# To plot all gravity anomaly, and crustal models along the Profile1

# beginning of GMT code frame
gmt begin profile1_plot png
# Setting the configuration of Subplot
gmt subplot begin 2x1 -Fs10c/5c -M0.5c 
# GMT code frame for 1 subplot
gmt subplot set 0,0
gmt set MAP_FRAME_TYPE plain
# plotting all gravity anomalies along profile1
gmt plot FAA_pamir_dataset_150_P1.txt -i4,3 -R0/1268/-400/200 -W0.5p,black,dashed -JX10c/5c -Bxa300f100+l"Distance(in km)" -Bya100f50+l"Gravity Anomaly(in mgal)" #-Y1c -BESen
gmt plot SCBA_P1.txt -i4,3 -W0.5p,blue 
gmt plot BA_150_P1.txt -i4,3 -W0.5p,violet 
gmt plot SCIBA_P1.txt -i4,3  -W0.5p,red,dashed
# plotting elevation data along profile1
gmt plot pamir_dataset_150_P1.txt -i4,3s0.001 -R0/1268/0/6 -JX10c/1.5c -W0.5p,brown -Bya2+l"Elevation(in Km)" -BESen
gmt legend legend_GA.txt -Dx0.35/3.55+w2c/1.5c 
gmt legend elevation_text.txt -Dx0.35/0.55+w2c/0.5c 
# GMT code frame for 2 subplot
gmt subplot set 1,0
gmt set MAP_FRAME_TYPE plain
# plotting all crustal models along profile2 and seismicity in the 50km eigther side of the Profile1
gmt plot crustal_thickP_P1.txt -i4,3s-1 -R0/1268/-250/0 -W0.5p,orange,.-  -Bya50f10+l"Depth" -Bxa300f100
gmt plot crustal_thick_P1.txt -i4,3s-1 -R0/1268/-250/0 -W0.5p,red,.- 
gmt makecpt -Cred,yellow,blue,green -T0,20,40,80,900
gmt plot seism_0-900_P1.txt -i3,2s-1 -R0/1268/-250/0 -Sc0.05c -Ggreen -t70 -W0.5p,black 
# Bouguer inverted crustal model by using oldenburg method
gmt plot Bou_Inv_Crustal_Thick_200-500_P1.txt -i4,3s-1 -R0/1268/-250/0 -W0.5p,blue,.-
gmt plot CAM2016Litho_P1.txt -i4,3s-1 -W0.5p,black,-
gmt plot RF_P1.txt -i3,2s-1 -Sc0.1c -Gorange
gmt legend legend_crust.txt -Dx0/1.5+w3c/1.6c 
gmt subplot end
# end of the subplot
gmt end show
# end of the GMT code frame
