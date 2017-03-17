//
//  CustomImageRetouchCIFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/27.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

open class CustomImageRetouchCIFilter: CIFilter {
	
	public var inputImage: CIImage?
	
	open override func setDefaults() {
		super.setDefaults()
		self.inputImage = nil
	}
	
	override open var outputImage: CIImage? {
		
		return self.inputImage
		
	}
	
}

extension CustomImageRetouchCIFilter {
	
	public func getRetouchedImage(from originalImage: UIImage?, in context: CIContext? = nil) -> UIImage? {
		
		guard let originalImage = originalImage else {
			return nil
		}
		
		guard let originalCIImage = originalImage.ciImage ?? CIImage(image: originalImage) else {
			return originalImage
		}
		
		self.inputImage = originalCIImage
		
		guard let outputCIImage = self.outputImage else {
			return originalImage
		}
		
		if let context = context, let outputImage = context.createImage(outputCIImage, from: outputCIImage.extent) {
			return outputImage
			
		} else {
			return UIImage(ciImage: outputCIImage)
			
		}
		
	}
	
}
