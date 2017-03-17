//
//  OverlayBlendModeFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/04.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class OverlayBlendModeFilter: CustomImageRetouchCIFilter {
	
	private let _overlayBlendModeFilter = CIFilter.CICategory.CompositeOperation.makeOverlayBlendMode()
	
	public var inputBlendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._overlayBlendModeFilter.setDefaults()
		self.inputBlendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.inputBlendingImage else {
			return inputImage
		}
		
		let overlayBlendModeFilter = self._overlayBlendModeFilter
		overlayBlendModeFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		overlayBlendModeFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = overlayBlendModeFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
