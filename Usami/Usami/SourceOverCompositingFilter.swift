//
//  SourceOverCompositingFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/04.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class SourceOverCompositingFilter: CustomImageRetouchCIFilter {
	
	private let inputSourceOverCompositingFilter: CIFilter = {
		guard let filter = CIFilter(name: "CISourceOverCompositing") else {
			fatalError("CISourceOverCompositing not exist")
		}
		return filter
	}()
	
	public var inputCompositingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self.inputSourceOverCompositingFilter.setDefaults()
		self.inputCompositingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let compositingImage = self.inputCompositingImage else {
			return inputImage
		}
		
		let sourceOverCompositingFilter = self.inputSourceOverCompositingFilter
		sourceOverCompositingFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		sourceOverCompositingFilter.setValue(compositingImage, forKey: kCIInputImageKey)
		guard let compositedImage = sourceOverCompositingFilter.outputImage else {
			return inputImage
		}
		
		return compositedImage
		
	}
	
}
