//
//  RadialGradientGenerator.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/16.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class RadialGradientGenerator: CIFilter {
	
	private let _generator: CIFilter = {
		guard let filter = CIFilter(name: "CIRadialGradient") else {
			fatalError("CIRadialGradient filter not exist")
		}
		return filter
	}()
	
	private var defaultExtent: CGRect { return .zero }
	private var defaultRadialCenter: CIVector { return CIVector(x: 0, y: 0) }
	private var defaultInnerRadius: CGFloat { return 0 }
	private var defaultInnerColor: CIColor { return CIColor(red: 1, green: 1, blue: 1) }
	private var defaultOuterRadius: CGFloat = 0
	private var defaultOuterColor: CIColor { return CIColor(red: 0, green: 0, blue: 0) }
	
	public lazy var inputExtent: CGRect = self.defaultExtent
	public lazy var inputRadialCenter: CIVector = self.defaultRadialCenter
	public lazy var inputInnerRadius: CGFloat = self.defaultInnerRadius
	public lazy var inputInnerColor: CIColor = self.defaultInnerColor
	public lazy var inputOuterRadius: CGFloat = self.defaultOuterRadius
	public lazy var inputOuterColor: CIColor = self.defaultOuterColor
	
	override public func setDefaults() {
		super.setDefaults()
		self._generator.setDefaults()
		self.inputExtent = self.defaultExtent
		self.inputRadialCenter = self.defaultRadialCenter
		self.inputInnerRadius = self.defaultInnerRadius
		self.inputInnerColor = self.defaultInnerColor
		self.inputOuterRadius = self.defaultOuterRadius
		self.inputOuterColor = self.defaultOuterColor
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
		let outputImage = generatedImage?.cropping(to: extent)
		return outputImage
		
	}
	
}
