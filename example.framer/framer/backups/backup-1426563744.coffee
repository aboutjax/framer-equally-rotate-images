# This imports all the layers for "vend-loading" into vendLoadingLayers
il = Framer.Importer.load "imported/vend-loading"

artboardWidth = il.artboard1.width
artboardHeight = il.artboard1.height

artboard1 = il.artboard1
artboard2 = il.artboard2
artboard3 = il.artboard3
artboard4 = il.artboard4

artboard2.originX = artboard2.midX
artboard2.originY = artboard2.maxY

artboard2.rotation = 10



allArtboards = [artboard1, artboard2, artboard3, artboard4]

maskLayer = new Layer
	width: artboardWidth
	height: artboardHeight
	x: 0
	backgroundColor: "transparent"

maskLayer.center()

container = new Layer
	width: artboardWidth * allArtboards.length
	backgroundColor: '#FFF'

for artboard in allArtboards
	artboard.visible = true

allArtboards.superLayer = container

artboard1.superLayer = container
artboard2.superLayer = container
artboard3.superLayer = container
artboard4.superLayer = container

container.states.animationOptions =
	delay: 0.5
	curve: "spring(300,20,0)"