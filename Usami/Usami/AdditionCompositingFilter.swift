//
//  AdditionCompositingFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2017/03/16.
//  Copyright © 2017年 net.crazism. All rights reserved.
//

import CoreImage

public class AdditionCompositingFilter: CustomImageRetouchCIFilter {
	
	private let _additionCompositingFilter = CIFilter.CICategory.CompositeOperation.makeAdditionCompositing()
	
	public var inputCompositingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._additionCompositingFilter.setDefaults()
		self.inputCompositingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let compositingImage = self.inputCompositingImage else {
			return inputImage
		}
		
		let multiplyCompositingFilter = self._additionCompositingFilter
		multiplyCompositingFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		multiplyCompositingFilter.setValue(compositingImage, forKey: kCIInputImageKey)
		guard let compositedImage = multiplyCompositingFilter.outputImage else {
			return inputImage
		}
		
		return compositedImage
		
	}
	
}
