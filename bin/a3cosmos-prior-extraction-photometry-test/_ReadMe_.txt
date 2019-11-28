../a3cosmos-prior-extraction-photometry -catalog Input_Catalog.txt -sci Input_Images/*.cont.I.image.fits -out Prior_Extraction_Photometry_Test

../a3cosmos-prior-extraction-photometry-copy-fitted-fits-image Prior_Extraction_Photometry_Test Prior_Extraction_Photometry_Test_fit_2_fits

../a3cosmos-prior-extraction-photometry-print-fitted-fits-image-as-png Prior_Extraction_Photometry_Test_fit_2_fits Prior_Extraction_Photometry_Test_fit_2_png

