//
//  SourceOverCompositingFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/04.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class SourceOverCompositingFilter: CustomImageRetouchCIFilter {
	
	private let _sourceOverCompositingFilter = CIFilter(name: "CISourceOverCompositing")
	
	public var compositingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._sourceOverCompositingFilter?.setDefaults()
		self.compositingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let compositingImage = self.compositingImage, let sourceOverCompositingFilter = self._sourceOverCompositingFilter else {
			return inputImage
		}
		sourceOverCompositingFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		sourceOverCompositingFilter.setValue(compositingImage, forKey: kCIInputImageKey)
		guard let compositedImage = sourceOverCompositingFilter.outputImage else {
			return inputImage
		}
		
		return compositedImage
		
	}
	
}
