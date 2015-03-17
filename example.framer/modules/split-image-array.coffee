exports.splitImageArray = (array) ->
    index = 0
    count = array.length
    splitAngle = 360 / count
    for layer in array
        layer.originX = 0.5
        layer.originY = 1.5
        layer.rotationZ = splitAngle * index
        index++
    return splitAngle