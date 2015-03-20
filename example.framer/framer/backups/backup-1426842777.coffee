# Made with Framer
# By Jacky Lee & Tiffany Liu
# www.framerjs.com

# This imports all the layers for "vend-loading" into vendLoadingLayers
sketch = Framer.Importer.load "imported/vend-loading"
splitImageArray = require "split-image-array"

# Specifying the width and height of the Sketch artboards
artboardWidth = sketch.artboard1.width
artboardHeight = sketch.artboard1.height

# Creating a container for all the images (This container is what we will be rotating later)
container = new Layer
	width: artboardWidth
	height: artboardHeight
	clip: false;
	backgroundColor: "transparent"

# The origin is set to 1.5 in order to rotate the entire container the center
container.originY = 1.5

# Create a mask for the container
mask = new Layer
	backgroundColor: "#FFF"
	width: artboardWidth
	height: artboardHeight

# Mask layer clipping set to true to only show the image with the right angle
mask.clip = true

# Centering the mask layer to the center of window
mask.center()
window.onresize = -> mask.center()
container.superLayer = mask

# Declaring each artboards from Sketch import
artboard1 = sketch.artboard1
artboard2 = sketch.artboard2
artboard3 = sketch.artboard3
artboard4 = sketch.artboard4
artboard5 = sketch.artboard5

# Make an array out of the imported artboards
allArtboards = [artboard1, artboard2, artboard3, artboard4, artboard5]

# Make container as the superLayer of all the individual artboards
for artboard in allArtboards
	artboard.superLayer = container
	artboard.visible = true

# The following function does three things:
# 1. Count the number of images in the array and equally split up the angle rotation.
# 2. Rotate each image with new anchor with the calculated angle rotation.
# 3. Return the angle rotation to use in this file.

rotateAngle = splitImageArray.splitImageArray(allArtboards)

startAngle = 0

# Using the interval function to rotate the container 'rotateAngle' degrees every 1 second.
Utils.interval 1, ->
	container.animate
		properties: {rotationZ: startAngle + rotateAngle}
		curve: "spring(300,20,0)"
	startAngle = startAngle + rotateAngle
