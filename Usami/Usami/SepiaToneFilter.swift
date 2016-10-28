//
//  SepiaToneFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/27.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class SepiaToneFilter: CustomImageRetouchCIFilter {
	
	private let _sepiaFilter = CIFilter(name: "CISepiaTone")
	
	public override func setDefaults() {
		super.setDefaults()
		self._sepiaFilter?.setDefaults()
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		let image: CIImage
		if let filter = self._sepiaFilter {
			filter.setValue(self.inputImage, forKey: kCIInputImageKey)
			image = filter.outputImage ?? inputImage
			
		} else {
			image = inputImage
		}
		
		return image
		
	}
	
}
