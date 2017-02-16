//
//  SepiaToneFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/27.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class SepiaToneFilter: CustomImageRetouchCIFilter {
	
	private let _sepiaFilter = CIFilter.CICategory.ColorEffect.makeSepiaTone()
	
	public override func setDefaults() {
		super.setDefaults()
		self._sepiaFilter.setDefaults()
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		let sepiaFilter = self._sepiaFilter
		sepiaFilter.setValue(self.inputImage, forKey: kCIInputImageKey)
		guard let sepiaTonedImage = sepiaFilter.outputImage else {
			return inputImage
		}
		
		return sepiaTonedImage
		
	}
	
}
