#!/bin/bash
source "/Users/dzliu/Cloud/Github/a3cosmos/a3cosmos-prior-extraction/bin/bin_setup.bash"
CrabFitsImageArithmetic image_sci_input.fits times '+1.0' image_sci.fits      -remove-nan
CrabFitsImageArithmetic image_sci_input.fits '!=' image_sci_input.fits image_nan_mask.fits
CrabFitsImageArithmetic image_sci_input.fits times '-1.0' image_negative_input.fits
CrabFitsImageArithmetic image_sci_input.fits times '-1.0' image_negative.fits -remove-nan
CrabFitsImageArithmetic image_rms_input.fits times 1.0 image_rms.fits -replace-nan '1e30'
CrabFitsImageArithmetic image_psf_input.fits times 1.0 image_psf.fits -remove-nan

