//
//  HardLightBlendModeFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2017/03/14.
//  Copyright © 2017年 net.crazism. All rights reserved.
//

import CoreImage

public class HardLightBlendModeFilter: CustomImageRetouchCIFilter {
	
	private let _hardLightBlendModeFilter = CIFilter.CICategory.CompositeOperation.makeHardLightBlendMode()
	
	public var inputBlendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._hardLightBlendModeFilter.setDefaults()
		self.inputBlendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.inputBlendingImage else {
			return inputImage
		}
		
		let hardLightBlendModeFilter = self._hardLightBlendModeFilter
		hardLightBlendModeFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		hardLightBlendModeFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = hardLightBlendModeFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
