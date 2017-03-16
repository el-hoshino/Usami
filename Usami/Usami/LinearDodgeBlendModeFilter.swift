//
//  LinearDodgeBlendModeFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/28.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class LinearDodgeBlendModeFilter: CustomImageRetouchCIFilter {
	
	private let _linearDodgeBlendModeFilter = CIFilter.CICategory.CompositeOperation.makeLinearDodgeBlendMode()
	
	public var inputBlendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._linearDodgeBlendModeFilter.setDefaults()
		self.inputBlendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.inputBlendingImage else {
			return inputImage
		}
		
		let linearDodgeBlendModeFilter = self._linearDodgeBlendModeFilter
		linearDodgeBlendModeFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		linearDodgeBlendModeFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = linearDodgeBlendModeFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
