//
//  MaskedBlurFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/31.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class MaskedBlurFilter: CustomImageRetouchCIFilter {
	
	private let _affineClampFilter = CIFilter.CICategory.TileEffect.makeAffineClamp()
	private let _maskedVariableBlurFilter = CIFilter.CICategory.Blur.makeMaskedVariableBlur()
	private let _cropFilter = CIFilter.CICategory.GeometryAdjustment.makeCrop()
	
	public var inputRadius: CGFloat = 0
	public var inputMaskImage: CIImage?
	
	public override init() {
		super.init()
		self.setDefaults()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setDefaults()
	}
	
	public override func setDefaults() {
		super.setDefaults()
		self._affineClampFilter.setDefaults()
		self._maskedVariableBlurFilter.setDefaults()
		self._cropFilter.setDefaults()
		self.inputRadius = 10
		self.inputMaskImage = nil
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
		
		let maskedVariableBlurFilter = self._maskedVariableBlurFilter
		let maskImage = self.inputMaskImage
		let radius = self.inputRadius
		maskedVariableBlurFilter.setValue(affineClampedImage, forKey: kCIInputImageKey)
		maskedVariableBlurFilter.setValue(maskImage, forKey: "inputMask")
		maskedVariableBlurFilter.setValue(radius, forKey: kCIInputRadiusKey)
		guard let blurredImage = maskedVariableBlurFilter.outputImage else {
			return affineClampedImage.cropped(to: inputImage.extent)
		}
		
		let cropFilter = self._cropFilter
		let originalRect = inputImage.extent
		cropFilter.setValue(blurredImage, forKey: kCIInputImageKey)
		cropFilter.setValue(originalRect, forKey: "inputRectangle")
		guard let croppedImage = cropFilter.outputImage else {
			return blurredImage.cropped(to: inputImage.extent)
		}
		
		return croppedImage
		
	}
	
}
