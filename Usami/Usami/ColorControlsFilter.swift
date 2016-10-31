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
	
	private let _colorControlsFilter = CIFilter(name: "CIColorControls")
	
	private var _brightness: CGFloat = 0
	public let brightnessRange: ClosedRange<CGFloat> = -1 ... 1
	public var brightness: CGFloat {
		set {
			self._brightness = newValue.limited(within: self.brightnessRange)
		}
		get {
			return self._brightness
		}
	}
	private var _contrast: CGFloat = 1
	public let contrastRange: ClosedRange<CGFloat> = 0 ... 4
	public var contrast: CGFloat {
		set {
			self._contrast = newValue.limited(within: self.contrastRange)
		}
		get {
			return self._contrast
		}
	}
	private var _saturation: CGFloat = 1
	public let saturationRange: ClosedRange<CGFloat> = 0 ... 2
	public var saturation: CGFloat {
		set {
			self._saturation = newValue.limited(within: self.saturationRange)
		}
		get {
			return self._saturation
		}
	}
	
	override public func setDefaults() {
		super.setDefaults()
		self._colorControlsFilter?.setDefaults()
		self.brightness = 0
		self.contrast = 1
		self.saturation = 1
	}
	
	override public var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let colorControlsFilter = self._colorControlsFilter else {
			return inputImage
		}
		
		let brightness = self.brightness
		let contrast = self.contrast
		let saturation = self.saturation
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
