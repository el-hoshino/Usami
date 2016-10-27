//
//  CustomFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/27.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

open class CustomCIFilter: CIFilter {
	
	open var customFilter: CIFilter? {
		return nil
	}
	
	public var inputImage: CIImage?
	
	override open var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let filter = self.customFilter else {
			return inputImage
		}
		
		return filter.outputImage
		
	}
	
	
}
