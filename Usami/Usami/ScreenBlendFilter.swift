//
//  ScreenBlendFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/04.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class ScreenBlendFilter: CustomImageRetouchCIFilter {
	
	private let _screenBlendFilter = CIFilter(name: "CIScreenBlendMode")
	
	public var blendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._screenBlendFilter?.setDefaults()
		self.blendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.blendingImage, let screenBlendFilter = self._screenBlendFilter else {
			return inputImage
		}
		screenBlendFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		screenBlendFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = screenBlendFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
