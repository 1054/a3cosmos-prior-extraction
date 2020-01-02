# a3cosmos-prior-extraction
a3cosmos prior source extraction tool


## Introduction
An astronmical image usually consists of emissions from astronomical objects, for example, galaxies. Here our tool is for fitting distant galaxies in deep field images, where galaxies are quite small and can be simply described by Gaussian or Sersic (intrinsic) shapes, or even point-like sources. For such small sources, what we see in the image is not the intrinsic source shapes, but the convolution of source shape and the instrumentational point spread function (PSF). Fitting these sources will need lots of computation of the convolution. The [GALFIT](https://users.obs.carnegiescience.edu/peng/work/galfit/galfit.html) software is a widely used tool to make such a (least-chi-square) fitting. Here we developed a wrapper tool which iteratively calls GALFIT to fit a list of prior sources in a number of input images. Our tool handles images with the [Jy/beam] physical unit which is commonly used in radio observations, while GALFIT internally uses magnitude system which is commonly used in optical observations. 

Our tool can be easily run in the BASH shell (which is usually the default shell) in Mac OS or Linux.



## Software dependency
You will need
* GNU findutils under Mac OS (e.g. can be installed via `sudo port install findutils`)
* `perl` (you should always already have it under Mac OS or Linux)
* `Python` with `numpy` `astropy` `scipy` `matplotlib`
* [Topcat](http://www.star.bris.ac.uk/~mbt/topcat/) (make sure you added it into your `$PATH` so that you can run `topcat` from anywhere in your Terminal)



## Example
Obtain our code and put it under some path, for example, `~/Cloud/Github/a3cosmos/a3cosmos-prior-extraction`.  

Then, cd into the example directory, `cd ~/Cloud/Github/a3cosmos/a3cosmos-prior-extraction/example/`. This will be where you want to run your code. 

Then, `source` our `SETUP.bash` in BASH shell, so that our command can be run in the shell:  
```
source ~/Cloud/Github/a3cosmos/a3cosmos-prior-extraction/SETUP.bash # this will add our command into the system's PATH
```

Then we have three steps. First, run the photometry! 
```
a3cosmos-prior-extraction-photometry \
        -cat Input_catalog/Catalog_Laigle_2016_ID_RA_Dec_Photo-z_Example.txt \
        -sci Input_image/sci.spw0_1_2_3.cont.I.image.fits \
        -psf Input_image/sci.spw0_1_2_3.cont.I.image.psf.fits
```
You can also specify `-rms <YOUR_RMS_IMAGE.FITS>`. If no rms image is given, we will compute an rms by fitting a 1D Gaussian to the pixel distribution histogram of the input image (the histogram will be output to the Input_image directory with names `*.pixel.histogram.eps` and `*.pixel.statistics.txt`).

If you have a cleaned ALMA image and have not generated a clean-beam PSF image, just do not set `-psf` so that our code will generate a clean-beam PSF image itself. It will be output to the input image directory.

If you have a primary beam attenuation (`*.pb.fits`) image, please input it by setting `-pba <YOUR_PBA_IMAGE.FITS>`. Otherwise pba will be always 1.

The default output directory is named like `"Read_Results_of_Prior_Extraction_Photometry_v<DATE>"`, depending on your running date. Below we take `20200102` as an example.

Then, read the results and combine them into ASCII-format tables:
```a3cosmos-prior-extraction-photometry-read-results \
        Read_Results_of_Prior_Extraction_Photometry_v20200102 
        # Combine photometry results and write ASCII-format tables 
```
The output will be several ASCII-format catalogs under the result folder. 

Finally, output the final FITS-format catalogs!
```
a3cosmos-prior-extraction-photometry-output-final-catalog \
        Read_Results_of_Prior_Extraction_Photometry_v20200102 
        # Output final FITS-format catalogs
```
They are named like "A-COSMOS_prior_2020-01-02_*.fits"
The one name like "A-COSMOS_prior_2020-01-02_Gaussian.fits" will probably be the most important output catalog.


