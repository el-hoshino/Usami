//
//  ScreenBlendFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/04.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class ScreenBlendFilter: CustomImageRetouchCIFilter {
	
	private let inputScreenBlendFilter: CIFilter = {
		guard let filter = CIFilter(name: "CIScreenBlendMode") else {
			fatalError("CIScreenBlendMode filter not exist")
		}
		return filter
	}()
	
	public var inputBlendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self.inputScreenBlendFilter.setDefaults()
		self.inputBlendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.inputBlendingImage else {
			return inputImage
		}
		
		let screenBlendFilter = self.inputScreenBlendFilter
		screenBlendFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		screenBlendFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = screenBlendFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
