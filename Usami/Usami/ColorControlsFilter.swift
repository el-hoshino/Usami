//
//  ColorControlsFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/28.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage
import Eltaso

public class ColorControlsFilter: CustomImageRetouchCIFilter {
	
	private let _colorControls = CIFilter.CICategory.ColorAdjustment.makeColorControls()
	
	public var inputBrightness: CGFloat = 0
	public var brightnessRange: ClosedRange<CGFloat> { return -1 ... 1 }
	private var adjustedBrightness: CGFloat { return self.inputBrightness.limited(within: self.brightnessRange) }
	
	public var inputContrast: CGFloat = 1
	public var contrastRange: ClosedRange<CGFloat> { return 0 ... 4 }
	private var adjustedContrast: CGFloat { return self.inputContrast.limited(within: self.contrastRange) }
	
	public var inputSaturation: CGFloat = 1
	public var saturationRange: ClosedRange<CGFloat> { return 0 ... 2 }
	private var adjustedSaturation: CGFloat { return self.inputSaturation.limited(within: self.saturationRange) }
	
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
		self._colorControls.setDefaults()
		self.inputBrightness = 0
		self.inputContrast = 1
		self.inputSaturation = 1
	}
	
	override public var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		let colorControlsFilter = self._colorControls
		let brightness = self.adjustedBrightness
		let contrast = self.adjustedContrast
		let saturation = self.adjustedSaturation
		colorControlsFilter.setValue(inputImage, forKey: kCIInputImageKey)
		colorControlsFilter.setValue(brightness, forKey: kCIInputBrightnessKey)
		colorControlsFilter.setValue(contrast, forKey: kCIInputContrastKey)
		colorControlsFilter.setValue(saturation, forKey: kCIInputSaturationKey)
		guard let colorControlledImage = colorControlsFilter.outputImage else {
			return inputImage
		}
		
		return colorControlledImage
		
	}
	
}
