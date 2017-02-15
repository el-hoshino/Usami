//
//  SmoothLinearGradientGenerator.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/17.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class SmoothLinearGradientGenerator: CIFilter {
	
	private let inputGenerator: CIFilter = {
		guard let filter = CIFilter(name: "CISmoothLinearGradient") else {
			fatalError("CISmoothLinearGradient filter not exist")
		}
		return filter
	}()
	
	public var defaultExtent: CGRect { return .zero }
	public var defaultAPoint: CIVector { return CIVector(x: 0, y: 0) }
	public var defaultAColor: CIColor { return CIColor(red: 1, green: 1, blue: 1, alpha: 1) }
	public var defaultBPoint: CIVector { return CIVector(x: 0, y: 0) }
	public var defaultBColor: CIColor { return CIColor(red: 0, green: 0, blue: 0, alpha: 0) }
	
	public lazy var inputExtent: CGRect = self.defaultExtent
	public lazy var inputAPoint: CIVector = self.defaultAPoint
	public lazy var inputAColor: CIColor = self.defaultAColor
	public lazy var inputBPoint: CIVector = self.defaultBPoint
	public lazy var inputBColor: CIColor = self.defaultBColor
	
	override public func setDefaults() {
		super.setDefaults()
		self.inputGenerator.setDefaults()
		self.inputExtent = self.defaultExtent
		self.inputAPoint = self.defaultAPoint
		self.inputAColor = self.defaultAColor
		self.inputBPoint = self.defaultBPoint
		self.inputBColor = self.defaultBColor	}
	
	override public var outputImage: CIImage? {
		
		let generator = self.inputGenerator
		let extent = self.inputExtent
		let aPoint = self.inputAPoint
		let aColor = self.inputAPoint
		let bPoint = self.inputBPoint
		let bColor = self.inputBColor
		
		generator.setValue(aPoint, forKey: "inputPoint0")
		generator.setValue(aColor, forKey: "inputColor0")
		generator.setValue(bPoint, forKey: "inputPoint1")
		generator.setValue(bColor, forKey: "inputColor1")
		
		let generatedImage = generator.outputImage
		let outputImage = generatedImage?.cropping(to: extent)
		return outputImage
		
	}

	
}
