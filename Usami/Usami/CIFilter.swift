//
//  CIFilter.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/26.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import CoreImage

extension CIFilter {
	
	@available(*, deprecated: 0.2.0, message: "CIFilter#getFilteredImage(from originalImage: UIImage?, in context: CIContext? = nil) is deprecated. Use CustomImageRetouchCIFilter#getRetouchedImage(from originalImage: UIImage?, in context: CIContext? = nil) instead.")
	public func getFilteredImage(from originalImage: UIImage?, in context: CIContext? = nil) -> UIImage? {
		
		guard let originalImage = originalImage else {
			return nil
		}
		
		guard let originalCIImage = originalImage.ciImage ?? CIImage(image: originalImage) else {
			return originalImage
		}
		
		self.setValue(originalCIImage, forKey: kCIInputImageKey)
		
		guard let outputCIImage = self.outputImage else {
			return originalImage
		}
		
		if let context = context, let outputCGImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) {
			return UIImage(cgImage: outputCGImage)
			
		} else {
			return UIImage(ciImage: outputCIImage)
			
		}
		
	}
	
}
