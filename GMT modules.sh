# contains all GMT modules 

gmt begin data png
# cuts the grid file to a desired given region and saving it into a new grid file
gmt grdcut earth_relief_02m.grd -R67/100/25/40 -Gtopo_NWH.grd
gmt grdcut FAA_pamir_dataset.grd -R68/75/31.5/41.5 -Gtopo_P1.grd
gmt grdcut pamir_dataset.grd -R68/75/31.5/41.5 -Gtopo_P1.grd
gmt grdcut SCBA.grd -R66/77/30/43 -GSCBA_P1.grd
gmt grdcut pamir_dataset.grd -R66/77/30/43 -Gtopo_P1.grd
gmt grdcut pamir_dataset_150.grd -R68/75/31.5/33.5 -Gpamir_dataset_150_P1.grd
gmt grdcut pamir_dataset_150.grd -R68/75/33.5/35.5 -Gpamir_dataset_150_P2.grd
gmt grdcut pamir_dataset_150.grd -R68/75/35.5/37.5 -Gpamir_dataset_150_P3.grd
gmt grdcut pamir_dataset_150.grd -R68/75/37.5/39.5 -Gpamir_dataset_150_P4.grd
gmt grdcut pamir_dataset_150.grd -R68/75/39.5/41.5 -Gpamir_dataset_150_P5.grd
gmt grdcut BA_pamir_dataset.grd -R68/75/31.5/33.5 -GBA_pamir_dataset_P1.grd
gmt grdcut BA_pamir_dataset.grd -R68/75/33.5/35.5 -GBA_pamir_dataset_P2.grd
gmt grdcut BA_pamir_dataset.grd -R68/75/35.5/37.5 -GBA_pamir_dataset_P3.grd
gmt grdcut BA_pamir_dataset.grd -R68/75/37.5/39.5 -GBA_pamir_dataset_P4.grd
gmt grdcut BA_pamir_dataset.grd -R68/75/39.5/41.5 -GBA_pamir_dataset_P5.grd
gmt grdcut Crust_thickness.xyz -R68/75/31.5/33.5 -Gcrust_P1_1.grd
gmt grdcut Crust_thickness.xyz -R68/75/33.5/35.5 -Gcrust_P1_2.grd
gmt grdcut Crust_thickness.xyz -R68/75/35.5/37.5 -Gcrust_P1_3.grd
gmt grdcut Crust_thickness.xyz -R68/75/37.5/39.5 -Gcrust_P1_4.grd
gmt grdcut Crust_thickness.xyz -R68/75/39.5/41.5 -Gcrust_P1_5.grd
gmt grdcut BA_pamir_dataset.grd -R68/75/32/41 -GBA_pamir_dataset_P1.grd
gmt grdcut depth_to_moho.xyz -R60/85/20/50 -Gdepth_to_mohoP_1d.grd
gmt grdcut depth_to_mohoP_2m.grd -R65/80/25/45 -Gdepth_to_mohoP_2m.grd
gmt grdcut WGM2012_Isostatic_ponc_2min.grd -R65/80/34/45 -GIA_pamir_dataset.grd
# filter the grid file using various types of filter, here in first cosine filter is used with 50km cutoff wavelength
gmt grdfilter topo_NWH.grd -fg -Fc50 -D4 -Gsmoothed_topo.grd
gmt grdfilter BA_pamir_dataset.grd -fg -Fc150 -D4 -GBA_pamir_dataset_250.grd
gmt grdfilter crustal_thick.grd -fg -Fc150 -D4 -Gcrustal_thick_150.grd
gmt grdfilter pamir_dataset.grd -fg -Fc150 -D4 -Gpamir_dataset_150.grd
gmt grdfilter SCBA.grd -fg -Fc150 -D4 -GSCBA_150.grd 
gmt grdfilter BA_pamir_dataset.grd -fg -Fc150 -D4 -GBA_150.grd
gmt grdfilter FAA_pamir_dataset.grd -R -fg -Fc150 -D4 -Gtopo_P1_250.grd
gmt grdfilter topo_P1.grd -fg -Fc250+4 -D4 -Gtopo_P1_250.grd
gmt grdfilter SCBA_P1.grd -fg -Fc250+4 -D4 -GSCBA_P1_250.grd
gmt grdfilter topo_P1.grd -fg -Fc450+4 -D4 -Gtopo_P1_450.grd
gmt grdfilter SCBA_P1.grd -fg -Fc450+4 -D4 -GSCBA_P1_450.grd
gmt grdfilter topo_P1.grd -fg -Fc450 -D4 -Gtopo_P1_450.grd
gmt grdfilter BA_P1.grd -fg -Fc450 -D4 -GBA_P1_450.grd
gmt grdfilter topo_P1_1.grd -fg -Fc250+4 -D4 -Gtopo_P1_1_250.grd
gmt grdfilter topo_P1_2.grd -fg -Fc250+4 -D4 -Gtopo_P1_2_250.grd
gmt grdfilter topo_P1_3.grd -fg -Fc250+4 -D4 -Gtopo_P1_3_250.grd
gmt grdfilter topo_P1_4.grd -fg -Fc250+4 -D4 -Gtopo_P1_4_250.grd
gmt grdfilter topo_P1_5.grd -fg -Fc250+4 -D4 -Gtopo_P1_5_250.grd
gmt grdfilter SCBA_P1_1.grd -fg -Fc250+4 -D4 -GSCBA_P1_1_250.grd
gmt grdfilter SCBA_P1_2.grd -fg -Fc250+4 -D4 -GSCBA_P1_2_250.grd
gmt grdfilter SCBA_P1_3.grd -fg -Fc250+4 -D4 -GSCBA_P1_3_250.grd
gmt grdfilter SCBA_P1_4.grd -fg -Fc250+4 -D4 -GSCBA_P1_4_250.grd
gmt grdfilter SCBA_P1_5.grd -fg -Fc250+4 -D4 -GSCBA_P1_5_250.grd
gmt grdfilter earth_relief_01d.grd -Fg112 -D4 -Gsmoothed_crust_thick.grd
# alter the sampling of a grid file by averaging or interpolating to upscale or downscale respectively
gmt grdsample CAM2016Litho.nc -GCAM2016Litho_2m.grd -I2m
gmt grdsample depth_to_mohoP_1d.grd -Gdepth_to_mohoP_2m.grd -I2m
gmt grdsample sed_lower.grd -R65/80/25/45 -Gsed_lower.grd
# extracts the data from a grid file along the given profile and store it in new text file
gmt grdtrack Profile2.txt -GBA_150.grd > BA_150_P2.txt
gmt grdtrack Profile1.txt -GBA_150.grd > BA_150_P1.txt
gmt grdtrack Profile2.txt -GSCBA_150.grd  > SCBA_150_P2.txt
gmt grdtrack Profile2.txt -GSCIBA_150.grd  > SCIBA_150_P2.txt
gmt grdtrack Profile2.txt -Gpamir_dataset_150.grd  > pamir_dataset_150_P2.txt
gmt grdtrack Profile2.txt -Gsmoothed_crustal_thickP_150.grd  > smoothed_crustal_thickP_150_P2.txt
gmt grdtrack Profile2.txt -Gcrustal_thick_150.grd  > crustal_thick_150_P2.txt
gmt grdtrack Profile2.txt -GBou_Inv_Crustal_Thick_200-500.grd  > Bou_Inv_Crustal_Thick_200-500_P2.txt
gmt grdtrack Profile1.txt -GBA_pamir_dataset.grd > BA_P1_C.txt
gmt grdtrack Profile1.txt -GFAA_pamir_dataset.grd > FAA_pamir_dataset_P1.txt
gmt grdtrack Profile2.txt -Gpamir_dataset.grd > pamir_dataset_P2.txt
gmt grdtrack Profile2.txt -GBA_pamir_dataset.grd > BA_pamir_dataset_P2.txt
gmt grdtrack Profile2.txt -GFAA_pamir_dataset.grd > FAA_pamir_dataset_P2.txt
gmt grdtrack Profile1.txt -Gpamir_dataset_150.grd > pamir_dataset_150_P1.txt
gmt grdtrack Profile1.txt -GSCBA_0.5.grd > SCBA_P1.txt
gmt grdtrack Profile1.txt -GSCIBA_0.5.grd > SCIBA_P1.txt
gmt grdtrack Profile1.txt -Gsmoothed_crustal_thickP_150.grd > crustal_thickP_P1.txt
gmt grdtrack Profile1.txt -Gcrustal_thick.grd > crustal_thick_P1.txt
# performs the mathematical operations like sub, add and Mul etc on grid file
gmt grdmath topo_P1_250.grd topo_P1_450.grd SUB = topo_P1_250-450.grd
gmt grdmath SCBA_P1_250.grd SCBA_P1_450.grd SUB = SCBA_P1_250-450.grd
gmt grdmath sed_lower.grd 0 NAN 1 = mask.grd
gmt grdmath IA_pamir_dataset.grd sed_corr.grd ADD = SCIBA.grd
gmt grdmath sed_lower.grd BA_pamir_dataset.grd ADD = SCBA.grd
gmt grdmath smoothed_crust_thick.grd 0.001 MUL = smoothed_crust_thick.grd
gmt grdmath roots.grd $t ADD = crustal_thick.grd
gmt grdmath crustal_thick.grd 0.001 MUL = crustal_thick.grd
gmt grdmath smoothed_crustal_thickP_150.grd 0.001 MUL = smoothed_crustal_thickP_150.grd
gmt math 1 AMP_Spect_P1.txt -i0 DIV = AMP_Spect_wave.txt
gmt math 6.2831 AMP_Spect_wave.txt MUL = AMP_Spect_wave.txt
gmt math AMP_Spect_P1.txt -i1 LOG10 = AMP_Spect_log.txt
gmt math 6.2831 Admitt_wave.txt MUL = Admitt_wave.txt
# performs the mathematical operations like sub, add and Mul etc on text file
gmt math AMP_Spect_P1.txt  -i0 = sqrt.txt
# Computes the Fourier transform of grid file if one grid is given and admittance, coherence, and cross spectrum if two grid file is given 
gmt gravfft topo_P1_250.grd  SCBA_P1_250.grd -Ic -GSCBA_P1FCohe.txt -fg
gmt gravfft topo_P1_250.grd  SCBA_P1_250.grd -I -GSCBA_P1FAdmitt.txt -fg
gmt gravfft pamir_dataset_150_P1.grd  BA_pamir_dataset_P1.grd -Ic -GBC_pamir_150_dataset_P1.txt -fg
gmt gravfft pamir_dataset_150_P2.grd  BA_pamir_dataset_P2.grd -Ic -GBC_pamir_150_dataset_P2.txt -fg
gmt gravfft pamir_dataset_150_P3.grd  BA_pamir_dataset_P3.grd -Ic -GBC_pamir_150_dataset_P3.txt -fg
gmt gravfft pamir_dataset_150_P4.grd  BA_pamir_dataset_P4.grd -Ic -GBC_pamir_150_dataset_P4.txt -fg
gmt gravfft pamir_dataset_150_P5.grd  BA_pamir_dataset_P5.grd -Ic -GBC_pamir_150_dataset_P5.txt -fg
gmt gravfft pamir_dataset_150_P1.grd  BA_pamir_dataset_P1.grd -I -GBAd_pamir_150_dataset_P1.txt -fg
gmt gravfft pamir_dataset_150_P2.grd  BA_pamir_dataset_P2.grd -I -GBAd_pamir_150_dataset_P2.txt -fg
gmt gravfft pamir_dataset_150_P3.grd  BA_pamir_dataset_P3.grd -I -GBAd_pamir_150_dataset_P3.txt -fg
gmt gravfft pamir_dataset_150_P4.grd  BA_pamir_dataset_P4.grd -I -GBAd_pamir_150_dataset_P4.txt -fg
gmt gravfft pamir_dataset_150_P5.grd  BA_pamir_dataset_P5.grd -I -GBAd_pamir_150_dataset_P5.txt -fg
# convert text file to grid file
gmt xyz2grd Vp%_P2.txt -i0,1s-1,2 -R0/2223.9/0/220 -I18.5325/10 -GVp%_P2_+ve.grd
gmt xyz2grd pamir_dataset_P1.txt > pamir_dataset_P1.grd
# convert grid file to text file
gmt grd2xyz crust_P1_2.grd > crust_P1_2.txt
gmt grd2xyz crust_P1_3.grd > crust_P1_3.txt
gmt grd2xyz crust_P1_4.grd > crust_P1_4.txt
gmt grd2xyz crust_P1_5.grd > crust_P1_5.txt
gmt grd2xyz FAA_pamir_dataset.grd > FAA_pamir_dataset.txt
gmt grd2xyz BA_pamir_dataset.grd > BA_pamir_dataset.txt
gmt grd2xyz pamir_dataset.grd > pamir_dataset.txt
gmt grd2xyz Crust_thickness_P1.grd > Crust_thickness_P1.txt
gmt grd2xyz pamir_dataset_P1.grd > pamir_dataset_P1.txt
# map the grid image on basemap
gmt grdimage pamir_dataset_P1.grd -Cjet -I
gmt grdimage pamir_dataset_P1.grd -I -Cjet
gmt grdimage SCIBA.grd -I -Cjet
gmt grdimage smoothed_crust_thick.grd -I -C
gmt grdimage smoothed_crustal_thickP_150.grd -I -C
gmt grdimage smoothed_50.grd  -I -C
# select the data on xyz km either side of the line 
gmt select pamir_dataset.txt -LProfile1.txt+d10k > pamir_dataset_P1.grd
gmt select FAA_pamir_dataset.txt  -LProfile1.txt+d10k > FAA_pamir_dataset_P1.grd
gmt select Combined_RF.txt -fg -i0,1,2 -LProfile1.txt+d50k  > RF_P1.txt
gmt select Combined_RF.txt -fg -i0,1,2 -LProfile2.txt+d50k  > RF_P2.txt
gmt select INT_EQ.txt -LProfile1.txt+d50k > INT_EQ_P1.txt
# project the coordinates points in between the profile line joining start and end points
gmt project -C71/25 -E71/45 -G0.1 > Profile2.txt 

# 1D filtering
gmt filter1d topo_P1_WF.txt -D4 -Fc250+4 > topo_cosine_250.txt
gmt filter1d cohe.txt -i0,1 -Fc150 > cohe_150.txt

#ps=2.3 , pc=2.7 hence del_p=0.4, del_g=0.04193*p*h K=0.04193*0.4=0.016772
#K=0.016772

# creating basemap
gmt basemap -R65/80/25/45 -Baf -Ba1 -JM15c -B+t"Crustal Thickness"
gmt basemap -R65/80/34/45 
gmt basemap -R65/80/25/45 -Baf -Ba1
# create color pallet
gmt makecpt -Cjet -T30/65/5
gmt makecpt -Cjet -T0/70/5
# create colorbar
gmt colorbar -Dx-3.5/1+w10c/0.5c+e -Bx+l"Crustal Difference(in Km)" -B5 -I -F+pthick
gmt colorbar -Dx0.5/-1.5+w14c/0.5c+e+h -Bx+l"Crustal Thickness(in Kms)" -B5 -I -F+pthick
# mark coastline
gmt coast -B -W0.5p,grey35 -Slightblue
# plot contour curves
gmt grdcontour smoothed_150.grd -C200 -A600 -Wcthinnest,red -Wathin,black
gmt end show
