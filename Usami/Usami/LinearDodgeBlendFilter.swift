//
//  LinearDodgeBlendFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/28.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class LinearDodgeBlendFilter: CustomImageRetouchCIFilter {
	
	private let inputLinearDodgeBlendFilter: CIFilter = {
		guard let filter = CIFilter(name: "CILinearDodgeBlendMode") else {
			fatalError("CILinearDodgeBlendMode filter not exist")
		}
		return filter
	}()
	
	public var inputBlendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self.inputLinearDodgeBlendFilter.setDefaults()
		self.inputBlendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.inputBlendingImage else {
			return inputImage
		}
		
		let linearDodgeBlendFilter = self.inputLinearDodgeBlendFilter
		linearDodgeBlendFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		linearDodgeBlendFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = linearDodgeBlendFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
