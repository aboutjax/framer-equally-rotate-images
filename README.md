## What does it do?
Give the function an array of images, and it will automatically rotate them equally along a circle.

![Descriptiong](http://i.imgur.com/XFaGda2.png)

#Example
[![Framer Prototype](https://cloud.githubusercontent.com/assets/5724081/11135391/79cb3e98-8a09-11e5-87bf-b9a2200a2768.gif)](http://share.framerjs.com/qhoqu1p9urk6/)

#Instructions
1.Include the module in your Framer prototype file.
```
splitImageArray = require "split-image-array"
```

2.Add your images to an array, technically you can add however many images you want, under 8 is optimal
```
allArtboards = [artboard1, artboard2, artboard3, artboard4, artboard5]
```

3.Give the `splitImageArray()` the image array
```
splitImageArray.splitImageArray(allArtboards)
```
