//
//  MaskedBlurFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/31.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class MaskedBlurFilter: CustomImageRetouchCIFilter {
	
	private let _affineClampFilter = CIFilter(name: "CIAffineClamp")
	private let _maskedVariableBlurFilter = CIFilter(name: "CIMaskedVariableBlur")
	private let _cropFilter = CIFilter(name: "CICrop")
	
	public var radius: CGFloat = 10
	public var maskImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._affineClampFilter?.setDefaults()
		self._maskedVariableBlurFilter?.setDefaults()
		self._cropFilter?.setDefaults()
		self.radius = 10
		self.maskImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let affineClampFilter = self._affineClampFilter else {
			return inputImage
		}
		let transform = CGAffineTransform(scaleX: 1, y: 1)
		affineClampFilter.setValue(inputImage, forKey: kCIInputImageKey)
		affineClampFilter.setValue(transform, forKey: kCIInputTransformKey)
		guard let affineClampedImage = affineClampFilter.outputImage else {
			return inputImage
		}
		
		guard let maskedVariableBlurFilter = self._maskedVariableBlurFilter else {
			return affineClampedImage.cropping(to: inputImage.extent)
		}
		let maskImage = self.maskImage
		let radius = self.radius
		maskedVariableBlurFilter.setValue(affineClampedImage, forKey: kCIInputImageKey)
		maskedVariableBlurFilter.setValue(maskImage, forKey: "inputMask")
		maskedVariableBlurFilter.setValue(radius, forKey: kCIInputRadiusKey)
		guard let blurredImage = maskedVariableBlurFilter.outputImage else {
			return affineClampedImage.cropping(to: inputImage.extent)
		}
		
		guard let cropFilter = self._cropFilter else {
			return blurredImage.cropping(to: inputImage.extent)
		}
		let originalRect = inputImage.extent
		cropFilter.setValue(blurredImage, forKey: kCIInputImageKey)
		cropFilter.setValue(originalRect, forKey: "inputRectangle")
		guard let croppedImage = cropFilter.outputImage else {
			return blurredImage.cropping(to: inputImage.extent)
		}
		
		return croppedImage
		
	}
	
}
