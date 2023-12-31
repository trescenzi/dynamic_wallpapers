# Making Dynamic Wallpapers from Giant Images

Roughly the process is as follows:

1. Use [Image Magick](https://imagemagick.org/) to cut the photo up into a bunch of different images.
1. Use [Equinox](https://equinoxmac.com) to turn the images into a dynamic wallpaper.

## Example Wallpapers

Because they are super huge these images are stored on Dropbox. I've made example dynamic wallpapers out of the JWST images for The Pillars of Creation and Rho Ophiuchi. You can [download them here](https://www.dropbox.com/scl/fo/crh5rvs8vpfpurm17wnwz/h?rlkey=kin2v0gzw3txosv2bze3tlhlo&dl=0).

Rho Ophiuchi             |  Pillars of Creation
:-------------------------:|:-------------------------:
![](https://live.staticflickr.com/65535/53040527259_43692103bd_c.jpg)  |  ![](https://live.staticflickr.com/65535/52439693830_516f44ba03_b.jpg)

## create_images

`create_images.sh` is a simple script that'll automatically cut an image up into a specified number of images with a 16:9 aspect ratio. It calculates the height the image needs to be cropped to in order get a 16:9 ratio. You must specify the image and you can optionally specify the number of times to cut up the image as well as a custom aspect ratio. It's pretty darn slow with big images.

This script assumes that you have Image Magick installed and that the `magick` and `identify` commands work locally.

### Arguments

1. `image` a path to the image which will be provided to Image Magick for cropping
2. `number of images(optional)` the number of images to create — defaults to 24 (i.e. one wallpaper change per hour)
3. `aspect width(optional)` a custom aspect width — defaults to 16
4. `aspect height(optional)` a custom aspect height — defaults to 9

### Examples

**Create 24 16:9 crops of rho_ophiuchi.png**: `sh create_images.sh rho_ophiuchi.png`

**Create 12 16:9 crops of rho_ophiuchi.png**: `sh create_images.sh rho_ophiuchi.png 12`

**Create 12 10:9 crops of rho_ophiuchi.png**: `sh create_images.sh rho_ophiuchi.png 12 10`

**Create 12 10:10 crops of rho_ophiuchi.png**: `sh create_images.sh rho_ophiuchi.png 12 10 10`
