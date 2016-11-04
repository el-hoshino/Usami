//
//  OverlayBlendFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/04.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class OverlayBlendFilter: CustomImageRetouchCIFilter {
	
	private let _overlayBlendFilter = CIFilter(name: "CIOverlayBlendMode")
	
	public var blendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._overlayBlendFilter?.setDefaults()
		self.blendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.blendingImage, let overlayBlendFilter = self._overlayBlendFilter else {
			return inputImage
		}
		overlayBlendFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		overlayBlendFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = overlayBlendFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
