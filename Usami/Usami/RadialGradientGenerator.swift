//
//  RadialGradientGenerator.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/16.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class RadialGradientGenerator: CIFilter {
	
	private let _generator = CIFilter(name: "CIRadialGradient")
	
	public var extent: CGRect? = nil
	public var radialCenter: CIVector = CIVector(x: 0, y: 0)
	public var innerRadius: CGFloat = 0
	public var innerColor: CIColor = CIColor(red: 1, green: 1, blue: 1, alpha: 1)
	public var outerRadius: CGFloat = 0
	public var outerColor: CIColor = CIColor(red: 0, green: 0, blue: 0, alpha: 0)
	
	override public func setDefaults() {
		super.setDefaults()
		self._generator?.setDefaults()
		self.extent = nil
		self.radialCenter = CIVector(x: 0, y: 0)
		self.innerRadius = 0
		self.innerColor = CIColor(red: 1, green: 1, blue: 1, alpha: 1)
		self.outerRadius = 0
		self.outerColor = CIColor(red: 0, green: 0, blue: 0, alpha: 0)
	}
	
	override public var outputImage: CIImage? {
		
		guard let generator = self._generator else {
			return nil
		}
		
		let radialCenter = self.radialCenter
		let innerRadius = self.innerRadius
		let innerColor = self.innerColor
		let outerRadius = self.outerRadius
		let outerColor = self.outerColor
		
		generator.setValue(radialCenter, forKey: kCIInputCenterKey)
		generator.setValue(innerRadius, forKey: "inputRadius0")
		generator.setValue(outerRadius, forKey: "inputRadius1")
		generator.setValue(innerColor, forKey: "inputColor0")
		generator.setValue(outerColor, forKey: "inputColor1")
		
		let outputImage = generator.outputImage
		if let extent = self.extent {
			return outputImage?.cropping(to: extent)
		} else {
			return outputImage
		}
		
	}
	
}
