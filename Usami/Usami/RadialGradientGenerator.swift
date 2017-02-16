//
//  RadialGradientGenerator.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/16.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class RadialGradientGenerator: CIFilter {
	
	private let _generator = CIFilter.CICategory.Gradient.makeRadialGradient()
	
	public var inputExtent: CIVector = CIVector(x: 0, y: 0, z: 0, w: 0)
	public var inputRadialCenter: CIVector = CIVector(x: 0, y: 0)
	public var inputInnerRadius: CGFloat = 0
	public var inputInnerColor: CIColor = CIColor(red: 1, green: 1, blue: 1)
	public var inputOuterRadius: CGFloat = 0
	public var inputOuterColor: CIColor = CIColor(red: 0, green: 0, blue: 0)
	
	public override init() {
		super.init()
		self.setDefaults()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setDefaults()
	}
	
	override public func setDefaults() {
		super.setDefaults()
		self._generator.setDefaults()
		self.inputExtent = CIVector(x: 0, y: 0, z: 0, w: 0)
		self.inputRadialCenter = CIVector(x: 0, y: 0)
		self.inputInnerRadius = 0
		self.inputInnerColor = CIColor(red: 1, green: 1, blue: 1)
		self.inputOuterRadius = 0
		self.inputOuterColor = CIColor(red: 0, green: 0, blue: 0)
	}
	
	override public var outputImage: CIImage? {
		
		let generator = self._generator
		let extent = self.inputExtent
		let radialCenter = self.inputRadialCenter
		let innerRadius = self.inputInnerRadius
		let innerColor = self.inputInnerColor
		let outerRadius = self.inputOuterRadius
		let outerColor = self.inputOuterColor
		
		generator.setValue(radialCenter, forKey: kCIInputCenterKey)
		generator.setValue(innerRadius, forKey: "inputRadius0")
		generator.setValue(outerRadius, forKey: "inputRadius1")
		generator.setValue(innerColor, forKey: "inputColor0")
		generator.setValue(outerColor, forKey: "inputColor1")
		
		let generatedImage = generator.outputImage
		let outputImage = generatedImage?.cropping(to: extent.cgRectValue)
		return outputImage
		
	}
	
}
