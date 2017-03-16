//
//  MultiplyBlendModeFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2017/03/16.
//  Copyright © 2017年 net.crazism. All rights reserved.
//

import CoreImage

public class MultiplyBlendModeFilter: CustomImageRetouchCIFilter {
	
	private let _multiplyBlendModeFilter = CIFilter.CICategory.CompositeOperation.makeMultiplyBlendMode()
	
	public var inputBlendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._multiplyBlendModeFilter.setDefaults()
		self.inputBlendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.inputBlendingImage else {
			return inputImage
		}
		
		let multiplyBlendModeFilter = self._multiplyBlendModeFilter
		multiplyBlendModeFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		multiplyBlendModeFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = multiplyBlendModeFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
