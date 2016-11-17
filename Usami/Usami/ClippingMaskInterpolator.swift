//
//  ClippingMaskInterpolator.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/17.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class ClippingMaskInterpolator: CIFilter {
	
	private let _interpolator = CIFilter(name: "CIBlendWithAlphaMask")
	
	public var upperImage: CIImage?
	public var lowerImage: CIImage?
	public var clippingMask: CIImage?
	
	override public func setDefaults() {
		super.setDefaults()
		self._interpolator?.setDefaults()
		self.upperImage = nil
		self.lowerImage = nil
		self.clippingMask = nil
	}
	
	override public var outputImage: CIImage? {
		
		guard let interplator = self._interpolator else {
			return nil
		}
		
		let upperImage = self.upperImage
		let lowerImage = self.lowerImage
		let clippingMask = self.clippingMask
		
		interplator.setValue(upperImage, forKey: kCIInputImageKey)
		interplator.setValue(lowerImage, forKey: kCIInputBackgroundImageKey)
		interplator.setValue(clippingMask, forKey: kCIInputMaskImageKey)
		
		return interplator.outputImage
		
	}
	
}
