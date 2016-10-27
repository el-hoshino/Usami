//
//  GaussianBlurFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/27.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class GaussianBlurFilter: CustomCIFilter {
	
	public var radius: CGFloat = 10
	
	public override var customFilter: CIFilter? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let affineClampFilter = CIFilter(name: "CIAffineClamp") else {
			return nil
		}
		let transform = CGAffineTransform(scaleX: 1, y: 1)
		affineClampFilter.setValue(inputImage, forKey: kCIInputImageKey)
		affineClampFilter.setValue(transform, forKey: kCIInputTransformKey)
		guard let affineClampedImage = affineClampFilter.outputImage else {
			return nil
		}
		
		guard let blurFilter = CIFilter(name: "CIGaussianBlur") else {
			return nil
		}
		let radius = self.radius
		blurFilter.setValue(affineClampedImage, forKey: kCIInputImageKey)
		blurFilter.setValue(radius, forKey: kCIInputRadiusKey)
		guard let blurredImage = blurFilter.outputImage else {
			return nil
		}
		
		guard let cropFilter = CIFilter(name: "CICrop") else {
			return nil
		}
		let originalRect = inputImage.extent
		cropFilter.setValue(blurredImage, forKey: kCIInputImageKey)
		cropFilter.setValue(originalRect, forKey: "inputRectangle")
		
		return cropFilter
		
	}
	
}
