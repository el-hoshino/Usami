//
//  ScreenBlendFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/04.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class ScreenBlendFilter: CustomImageRetouchCIFilter {
	
	private let _screenBlendFilter = CIFilter.CICategory.CompositeOperation.makeScreenBlendMode()
	
	public var inputBlendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._screenBlendFilter.setDefaults()
		self.inputBlendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.inputBlendingImage else {
			return inputImage
		}
		
		let screenBlendFilter = self._screenBlendFilter
		screenBlendFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		screenBlendFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = screenBlendFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
