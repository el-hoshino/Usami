//
//  SmoothLinearGradientGenerator.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/17.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class SmoothLinearGradientGenerator: CIFilter {
	
	private let _generator = CIFilter(name: "CISmoothLinearGradient")
	
	public var extent: CGRect? = nil
	public var aPoint: CIVector = CIVector(x: 0, y: 0)
	public var aColor: CIColor = CIColor(red: 1, green: 1, blue: 1, alpha: 1)
	public var bPoint: CIVector = CIVector(x: 0, y: 0)
	public var bColor: CIColor = CIColor(red: 0, green: 0, blue: 0, alpha: 0)
	
	override public func setDefaults() {
		super.setDefaults()
		self._generator?.setDefaults()
		self.extent = nil
		self.aPoint = CIVector(x: 0, y: 0)
		self.aColor = CIColor(red: 1, green: 1, blue: 1, alpha: 1)
		self.bPoint = CIVector(x: 0, y: 0)
		self.bColor = CIColor(red: 0, green: 0, blue: 0, alpha: 0)
	}
	
	override public var outputImage: CIImage? {
		
		guard let generator = self._generator else {
			return nil
		}
		
		let aPoint = self.aPoint
		let aColor = self.aColor
		let bPoint = self.bPoint
		let bColor = self.bColor
		
		generator.setValue(aPoint, forKey: "inputPoint0")
		generator.setValue(aColor, forKey: "inputColor0")
		generator.setValue(bPoint, forKey: "inputPoint1")
		generator.setValue(bColor, forKey: "inputColor1")
		
		let outputImage = generator.outputImage
		if let extent = self.extent {
			return outputImage?.cropping(to: extent)
		} else {
			return outputImage
		}
		
	}

	
}
