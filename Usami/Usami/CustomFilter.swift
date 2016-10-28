//
//  CustomFilter.swift
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
