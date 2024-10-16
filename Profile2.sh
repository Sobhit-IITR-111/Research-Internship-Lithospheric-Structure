# To plot all gravity anomaly, crustal models, and velocity model along the Profile2 

# beginning of GMT code frame
gmt begin profile2_plot png
# Setting the configuration of Subplot
gmt subplot begin 2x1 -Fs10c/5c -M0.5c 
# GMT code frame for 1 subplot
gmt subplot set 0,0
gmt set MAP_FRAME_TYPE plain
# plotting all gravity anomalies along profile2
gmt plot FAA_pamir_dataset_150_P2.txt -i4,3 -R0/2224/-600/200 -W0.5p,black,dashed -JX10c/5c -Bxa300f100+l"Distance(in km)" -Bya100f50+l"Gravity Anomaly(in mgal)" #-Y1c -BESen
gmt plot SCBA_150_P2.txt -i4,3 -W0.5p,blue 
gmt plot SCIBA_150_P2.txt -i4,3  -W0.5p,red,dashed 
gmt plot BA_150_P2.txt -i4,3 -W0.5p,violet 
# plotting elevation data along profile2
gmt plot pamir_dataset_150_P2.txt -i4,3s0.001 -R0/2224/0/6 -JX10c/1.5c -W0.5p,brown -Bya2+l"Elevation(in Km)" -BESen
gmt legend legend_GA.txt -Dx0.35/2+w2c/1.5c 
gmt legend elevation_text.txt -Dx0.35/0.55+w2c/0.5c 
# GMT code frame for 2 subplot
gmt subplot set 1,0
gmt set MAP_FRAME_TYPE plain
# plotting velocity model along profile2
gmt grdimage -R0/2224/-220/0 Vp%_P2.grd -CHMSL-P06_percent_longitude.cpt -t20 -Bya50f10+l"Depth" -Bxa300f100
# plotting all crustal models along profile2 and seismicity in the 50km eigther side of the Profile2
gmt plot crustal_thick_150_P2.txt -i4,3s-1 -R0/2224/-220/0 -W0.5p,red,.- 
gmt plot smoothed_crustal_thickP_150_P2.txt -i4,3s-1 -R0/2224/-220/0 -W0.5p,violet,.-  
gmt makecpt -Cred,yellow,blue,green -T0,20,40,80,900
gmt plot seism_0-900_P2.txt -i3,2s-1 -R0/2224/-220/0 -Sc0.05c -Ggreen -t70 -W0.5p,black 
gmt plot Bou_Inv_Crustal_Thick_200-500_P2.txt -i4,3s-1 -R0/2224/-220/0 -W0.5p,blue,.-
gmt plot CAM2016Litho_P2.txt -i4,3s-1 -R0/2224/-220/0 -W0.5p,black,-
gmt legend P2_leg_text.txt -Dx0/1.30+w3c/1.5c
gmt colorbar -CHMSL-P06_percent_longitude.cpt -Dx10.3/1+w3c/0.2c+e -Bx+l"Vp%" -B0.5 -I
gmt subplot end
# end of the subplot
gmt end show
# end of the GMT code frame