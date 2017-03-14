//
//  HardLightBlendFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2017/03/14.
//  Copyright © 2017年 net.crazism. All rights reserved.
//

import CoreImage

public class HardLightBlendFilter: CustomImageRetouchCIFilter {
	
	private let _hardLightBlendFilter = CIFilter.CICategory.CompositeOperation.makeHardLightBlendMode()
	
	public var inputBlendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._hardLightBlendFilter.setDefaults()
		self.inputBlendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.inputBlendingImage else {
			return inputImage
		}
		
		let hardLightBlendFilter = self._hardLightBlendFilter
		hardLightBlendFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		hardLightBlendFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = hardLightBlendFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
