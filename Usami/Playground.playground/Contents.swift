//: Playground - noun: a place where people can play

import PlaygroundSupport
import Usami

let view = PreviewView(frame: CGRect(x: 0, y: 0, width: 720, height: 360))
PlaygroundPage.current.liveView = view

let baseImage = #imageLiteral(resourceName: "lena.png")
view.imageA = baseImage

let gaussianBlurFilter = GaussianBlurFilter()
let filteredImage = gaussianBlurFilter.getFilteredImage(from: baseImage)
view.imageB = filteredImage
