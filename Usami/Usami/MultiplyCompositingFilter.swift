//
//  MultiplyCompositingFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/31.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class MultiplyCompositingFilter: CustomImageRetouchCIFilter {
	
	private let inputMultiplyCompositingFilter: CIFilter = {
		guard let filter = CIFilter(name: "CIMultiplyCompositing") else {
			fatalError("CIMultiplyCompositing filter not exist")
		}
		return filter
	}()
	
	public var inputCompositingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self.inputMultiplyCompositingFilter.setDefaults()
		self.inputCompositingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let compositingImage = self.inputCompositingImage else {
			return inputImage
		}
		
		let multiplyCompositingFilter = self.inputMultiplyCompositingFilter
		multiplyCompositingFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		multiplyCompositingFilter.setValue(compositingImage, forKey: kCIInputImageKey)
		guard let compositedImage = multiplyCompositingFilter.outputImage else {
			return inputImage
		}
		
		return compositedImage
		
	}
	
}
