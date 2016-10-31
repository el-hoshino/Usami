//
//  MultiplyCompositingFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/31.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class MultiplyCompositingFilter: CustomImageRetouchCIFilter {
	
	private let _multiplyCompositingFilter = CIFilter(name: "CIMultiplyCompositing")
	
	public var compositingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._multiplyCompositingFilter?.setDefaults()
		self.compositingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let compositingImage = self.compositingImage, let multiplyCompositingFilter = self._multiplyCompositingFilter else {
			return inputImage
		}
		multiplyCompositingFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		multiplyCompositingFilter.setValue(compositingImage, forKey: kCIInputImageKey)
		guard let compositedImage = multiplyCompositingFilter.outputImage else {
			return inputImage
		}
		
		return compositedImage
		
	}
	
}
