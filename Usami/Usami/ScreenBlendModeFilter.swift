//
//  ScreenBlendModeFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/04.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class ScreenBlendModeFilter: CustomImageRetouchCIFilter {
	
	private let _screenBlendModeFilter = CIFilter.CICategory.CompositeOperation.makeScreenBlendMode()
	
	public var inputBlendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._screenBlendModeFilter.setDefaults()
		self.inputBlendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.inputBlendingImage else {
			return inputImage
		}
		
		let screenBlendModeFilter = self._screenBlendModeFilter
		screenBlendModeFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		screenBlendModeFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = screenBlendModeFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
