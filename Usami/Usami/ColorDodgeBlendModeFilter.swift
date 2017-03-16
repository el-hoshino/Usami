//
//  ColorDodgeBlendModeFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/04.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class ColorDodgeBlendModeFilter: CustomImageRetouchCIFilter {
	
	private let _colorDodgeBlendModeFilter = CIFilter.CICategory.CompositeOperation.makeColorDodgeBlendMode()
	
	public var inputBlendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._colorDodgeBlendModeFilter.setDefaults()
		self.inputBlendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.inputBlendingImage else {
			return inputImage
		}
		
		let colorDodgeBlendModeFilter = self._colorDodgeBlendModeFilter
		colorDodgeBlendModeFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		colorDodgeBlendModeFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = colorDodgeBlendModeFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
