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
	
	private let inputColorControlsFilter: CIFilter = {
		guard let filter = CIFilter(name: "CIColorControls") else {
			fatalError("CIColorControls not exist")
		}
		return filter
	}()
	
	private var defaultBrightness: CGFloat { return 0 }
	private var defaultContrast: CGFloat { return 1 }
	private var defaultSaturation: CGFloat { return 1 }
	
	private lazy var inputAdjustedBrightness: CGFloat = self.defaultBrightness
	public let inputBrightnessRange: ClosedRange<CGFloat> = -1 ... 1
	public var inputBrightness: CGFloat {
		set {
			self.inputAdjustedBrightness = newValue.limited(within: self.inputBrightnessRange)
		}
		get {
			return self.inputAdjustedBrightness
		}
	}
	private lazy var inputAdjustedContrast: CGFloat = self.defaultContrast
	public let inputContrastRange: ClosedRange<CGFloat> = 0 ... 4
	public var inputContrast: CGFloat {
		set {
			self.inputAdjustedContrast = newValue.limited(within: self.inputContrastRange)
		}
		get {
			return self.inputAdjustedContrast
		}
	}
	private lazy var inputAdjustedSaturation: CGFloat = self.defaultSaturation
	public let inputSaturationRange: ClosedRange<CGFloat> = 0 ... 2
	public var inputSaturation: CGFloat {
		set {
			self.inputAdjustedSaturation = newValue.limited(within: self.inputSaturationRange)
		}
		get {
			return self.inputAdjustedSaturation
		}
	}
	
	override public func setDefaults() {
		super.setDefaults()
		self.inputColorControlsFilter.setDefaults()
		self.inputAdjustedBrightness = self.defaultBrightness
		self.inputAdjustedContrast = self.defaultContrast
		self.inputAdjustedSaturation = self.defaultSaturation
	}
	
	override public var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		let colorControlsFilter = self.inputColorControlsFilter
		let brightness = self.inputAdjustedBrightness
		let contrast = self.inputAdjustedContrast
		let saturation = self.inputAdjustedSaturation
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
