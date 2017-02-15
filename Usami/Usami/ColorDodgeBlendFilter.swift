//
//  ColorDodgeBlendFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/04.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class ColorDodgeBlendFilter: CustomImageRetouchCIFilter {
	
	private let inputColorDodgeBlendFilter: CIFilter = {
		guard let filter = CIFilter(name: "CIColorDodgeBlendMode") else {
			fatalError("CIColorDodgeBlendMode filter not exist")
		}
		return filter
	}()
	
	public var inputBlendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self.inputColorDodgeBlendFilter.setDefaults()
		self.inputBlendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.inputBlendingImage else {
			return inputImage
		}
		
		let colorDodgeBlendFilter = self.inputColorDodgeBlendFilter
		colorDodgeBlendFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		colorDodgeBlendFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = colorDodgeBlendFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
