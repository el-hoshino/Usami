//
//  ColorDodgeBlendFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/04.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class ColorDodgeBlendFilter: CustomImageRetouchCIFilter {
	
	private let _colorDodgeBlendFilter = CIFilter.CICategory.CompositeOperation.makeColorDodgeBlendMode()
	
	public var inputBlendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._colorDodgeBlendFilter.setDefaults()
		self.inputBlendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.inputBlendingImage else {
			return inputImage
		}
		
		let colorDodgeBlendFilter = self._colorDodgeBlendFilter
		colorDodgeBlendFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		colorDodgeBlendFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = colorDodgeBlendFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
