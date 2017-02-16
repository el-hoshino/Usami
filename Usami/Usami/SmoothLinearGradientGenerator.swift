//
//  SmoothLinearGradientGenerator.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/17.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class SmoothLinearGradientGenerator: CIFilter {
	
	private let _generator = CIFilter.CICategory.Gradient.makeSmoothLinearGradient()
	
	public var inputExtent: CIVector = CIVector(x: 0, y: 0, z: 0, w: 0)
	public var inputAPoint: CIVector = CIVector(cgPoint: CGPoint(x: 0, y: 0))
	public var inputAColor: CIColor = CIColor(red: 1, green: 1, blue: 1)
	public var inputBPoint: CIVector = CIVector(cgPoint: CGPoint(x: 0, y: 0))
	public var inputBColor: CIColor = CIColor(red: 0, green: 0, blue: 0)
	
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
		self.inputExtent = CIVector(cgRect: .zero)
		self.inputAPoint = CIVector(cgPoint: CGPoint(x: 0, y: 0))
		self.inputAColor = CIColor(red: 1, green: 1, blue: 1)
		self.inputBPoint = CIVector(cgPoint: CGPoint(x: 0, y: 0))
		self.inputBColor = CIColor(red: 0, green: 0, blue: 0)
	}
	
	override public var outputImage: CIImage? {
		
		let generator = self._generator
		let extent = self.inputExtent
		let aPoint = self.inputAPoint
		let aColor = self.inputAColor
		let bPoint = self.inputBPoint
		let bColor = self.inputBColor
		
		generator.setValue(aPoint, forKey: "inputPoint0")
		generator.setValue(aColor, forKey: "inputColor0")
		generator.setValue(bPoint, forKey: "inputPoint1")
		generator.setValue(bColor, forKey: "inputColor1")
		
		let generatedImage = generator.outputImage
		let outputImage = generatedImage?.cropping(to: extent.cgRectValue)
		return outputImage
		
	}
	
}
