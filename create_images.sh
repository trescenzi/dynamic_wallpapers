#! bin/bash
trap 'exit' SIGINT

num_images=${2:-24}
waspect=${3:-16}
haspect=${4:-9}
echo "Creating $num_images images for $1"
echo "Heads up this can take some time."
height=$(identify $1 | awk '{print $3}' | awk -F 'x' '{print $2}')
width=$(identify $1 | awk '{print $3}' | awk -F 'x' '{print $1}')
steps=$((num_images - 1))
crop_height=$((width * haspect / waspect))
step_height=$(((height - crop_height) / steps))
echo "Cropping each image to $crop_height px with a step of $step_height px with an aspect ratio of $waspect:$haspect."

for i in $(seq 0 "$steps"); do
  name=$1_crop_$i.png
  current_step_height=$((i * step_height))
  magick $1 -crop 0x$crop_height+0+$current_step_height $name
  echo "wrote $name"
done
