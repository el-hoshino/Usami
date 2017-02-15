//
//  ClippingMaskInterpolator.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/17.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class ClippingMaskInterpolator: CIFilter {
	
	private let inputInterpolator: CIFilter =  {
		guard let filter = CIFilter(name: "CIBlendWithAlphaMask") else {
			fatalError("CIBlendWithAlphaMask filter not exist")
		}
		return filter
	}()
	
	public var inputUpperImage: CIImage?
	public var inputLowerImage: CIImage?
	public var inputClippingMask: CIImage?
	
	override public func setDefaults() {
		super.setDefaults()
		self.inputInterpolator.setDefaults()
		self.inputUpperImage = nil
		self.inputLowerImage = nil
		self.inputClippingMask = nil
	}
	
	override public var outputImage: CIImage? {
		
		let interplator = self.inputInterpolator
		let upperImage = self.inputUpperImage
		let lowerImage = self.inputLowerImage
		let clippingMask = self.inputClippingMask
		
		interplator.setValue(upperImage, forKey: kCIInputImageKey)
		interplator.setValue(lowerImage, forKey: kCIInputBackgroundImageKey)
		interplator.setValue(clippingMask, forKey: kCIInputMaskImageKey)
		
		return interplator.outputImage
		
	}
	
}
