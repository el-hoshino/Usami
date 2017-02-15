//
//  SepiaToneFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/27.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class SepiaToneFilter: CustomImageRetouchCIFilter {
	
	private let inputSepiaFilter: CIFilter = {
		guard let filter = CIFilter(name: "CISepiaTone") else {
			fatalError("CISepiaTone filter not exist")
		}
		return filter
	}()
	
	public override func setDefaults() {
		super.setDefaults()
		self.inputSepiaFilter.setDefaults()
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		let sepiaFilter = self.inputSepiaFilter
		sepiaFilter.setValue(self.inputImage, forKey: kCIInputImageKey)
		guard let sepiaTonedImage = sepiaFilter.outputImage else {
			return inputImage
		}
		
		return sepiaTonedImage
		
	}
	
}
