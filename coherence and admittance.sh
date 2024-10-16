# To compute Admittance and Coherence of two grid files

# beginning of GMT code frame
gmt begin admittance png
# filtering Free Air Anomaly data using cosine filter with cutoff wavelength 150 km 
gmt grdfilter FAA_pamir_dataset_P1.grd -fg -D4 -Fc150 -GFAA_pamir_dataset_P1_150.grd
# filtering Free Air Anomaly data using cosine filter with cutoff wavelength 450 km 
gmt grdfilter FAA_pamir_dataset_P1.grd -fg -D4 -Fc450 -GFAA_pamir_dataset_P1_450.grd
# creating bandpass filter of band 150-450 Km 
gmt grdmath FAA_pamir_dataset_P1_150.grd FAA_pamir_dataset_P1_450.grd SUB = FAA_pamir_dataset_P1_150-450.grd
# computing free air Admittance
gmt gravfft pamir_dataset_P1_150-450.grd  FAA_pamir_dataset_P1_150-450.grd -Iwk -GFAAdmitt.txt -fg # use -Icwk instead of -Iwk to compute coherence
gmt end show
# end of the GMT code frame
