//
//  GaussianBlurFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/27.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class GaussianBlurFilter: CustomImageRetouchCIFilter {
	
	private let _affineClampFilter = CIFilter.CICategory.TileEffect.makeAffineClamp()
	private let _gaussianBlurFilter = CIFilter.CICategory.Blur.makeGaussianBlur()
	private let _cropFilter = CIFilter.CICategory.GeometryAdjustment.makeCrop()
	
	public var inputRadius: CGFloat = 0
	
	public override init() {
		super.init()
		self.setDefaults()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setDefaults()
	}
	
	deinit {
		print("Gaussian deinit")
	}
	
	public override func setDefaults() {
		super.setDefaults()
		self._affineClampFilter.setDefaults()
		self._gaussianBlurFilter.setDefaults()
		self._cropFilter.setDefaults()
		self.inputRadius = 10
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		let affineClampFilter = self._affineClampFilter
		let transform = CGAffineTransform(scaleX: 1, y: 1)
		affineClampFilter.setValue(inputImage, forKey: kCIInputImageKey)
		affineClampFilter.setValue(transform, forKey: kCIInputTransformKey)
		guard let affineClampedImage = affineClampFilter.outputImage else {
			return inputImage
		}
		
		let gaussianBlurFilter = self._gaussianBlurFilter
		let radius = self.inputRadius
		gaussianBlurFilter.setValue(affineClampedImage, forKey: kCIInputImageKey)
		gaussianBlurFilter.setValue(radius, forKey: kCIInputRadiusKey)
		guard let blurredImage = gaussianBlurFilter.outputImage else {
			return affineClampedImage.cropping(to: inputImage.extent)
		}
		
		let cropFilter = self._cropFilter
		let originalRect = inputImage.extent
		cropFilter.setValue(blurredImage, forKey: kCIInputImageKey)
		cropFilter.setValue(originalRect, forKey: "inputRectangle")
		guard let croppedImage = cropFilter.outputImage else {
			return blurredImage.cropping(to: inputImage.extent)
		}
		
		return croppedImage
		
	}
	
}
