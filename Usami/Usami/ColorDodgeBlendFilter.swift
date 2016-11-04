//
//  ColorDodgeBlendFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/04.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class ColorDodgeBlendFilter: CustomImageRetouchCIFilter {
	
	private let _colorDodgeBlendFilter = CIFilter(name: "CIColorDodgeBlendMode")
	
	public var blendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self._colorDodgeBlendFilter?.setDefaults()
		self.blendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.blendingImage, let colorDodgeBlendFilter = self._colorDodgeBlendFilter else {
			return inputImage
		}
		colorDodgeBlendFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		colorDodgeBlendFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = colorDodgeBlendFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
