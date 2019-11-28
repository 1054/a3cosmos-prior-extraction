#!/bin/bash
# 
source /Users/dzliu/Cloud/Github/a3cosmos/a3cosmos-prior-extraction/SETUP.bash
cd "/Users/dzliu/Cloud/Github/a3cosmos/a3cosmos-prior-extraction/bin/a3cosmos-prior-extraction-photometry-test/Prior_Extraction_Photometry_Test/"
astrodepth_prior_extraction_photometry \
                                       -cat '/Users/dzliu/Cloud/Github/a3cosmos/a3cosmos-prior-extraction/bin/a3cosmos-prior-extraction-photometry-test/Input_Catalog.txt'  \
                                       -sci "/Users/dzliu/Cloud/Github/a3cosmos/a3cosmos-prior-extraction/bin/a3cosmos-prior-extraction-photometry-test/Input_Images/2017.1.00428.L_SB_X1898_GB_X1899_MB_X189a_J0948+0022_sci.spw17_19_21_23.cont.I.image.fits" \
                                       -psf "/Users/dzliu/Cloud/Github/a3cosmos/a3cosmos-prior-extraction/bin/a3cosmos-prior-extraction-photometry-test/Input_Images/2017.1.00428.L_SB_X1898_GB_X1899_MB_X189a_J0948+0022_sci.spw17_19_21_23.cont.I.clean-beam.fits" \
                                       -rms "/Users/dzliu/Cloud/Github/a3cosmos/a3cosmos-prior-extraction/bin/a3cosmos-prior-extraction-photometry-test/Input_Images/2017.1.00428.L_SB_X1898_GB_X1899_MB_X189a_J0948+0022_sci.spw17_19_21_23.cont.I.rms.fits" \
                                       -pba "/Users/dzliu/Cloud/Github/a3cosmos/a3cosmos-prior-extraction/bin/a3cosmos-prior-extraction-photometry-test/Input_Images/2017.1.00428.L_SB_X1898_GB_X1899_MB_X189a_J0948+0022_sci.spw17_19_21_23.cont.I.pba.fits" \
                                       -buffer 0 \
                                       -output-dir "astrodepth_prior_extraction_photometry" \
                                       -output-name "2017.1.00428.L_SB_X1898_GB_X1899_MB_X189a_J0948+0022_sci.spw17_19_21_23.cont.I.image" \
                                       -steps getpix galfit gaussian sersic  final \
                                       -unlock none \
                                       -overwrite none


# do cleaning
if [[ -d "astrodepth_prior_extraction_photometry/2017.1.00428.L_SB_X1898_GB_X1899_MB_X189a_J0948+0022_sci.spw17_19_21_23.cont.I.image/" ]]; then
   cd "astrodepth_prior_extraction_photometry/2017.1.00428.L_SB_X1898_GB_X1899_MB_X189a_J0948+0022_sci.spw17_19_21_23.cont.I.image/"
   rm galfit.* aaa_* aaa.* *.sky2xy.* *.tmp *.backup 2>/dev/null
fi


