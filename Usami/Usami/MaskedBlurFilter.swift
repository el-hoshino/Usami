//
//  MaskedBlurFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/31.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class MaskedBlurFilter: CustomImageRetouchCIFilter {
	
	private let inputAffineClampFilter: CIFilter = {
		guard let filter = CIFilter(name: "CIAffineClamp") else {
			fatalError("CIAffineClamp not exist")
		}
		return filter
	}()
	private let inputMaskedVariableBlurFilter: CIFilter = {
		guard let filter = CIFilter(name: "CIMaskedVariableBlur") else {
			fatalError("CIMaskedVariableBlur filter not exist")
		}
		return filter
	}()
	private let inputCropFilter: CIFilter = {
		guard let filter = CIFilter(name: "CICrop") else {
			fatalError("CICrop filter not exist")
		}
		return filter
	}()
	
	private var defaultRadius: CGFloat { return 10 }
	
	public lazy var inputRadius: CGFloat = self.defaultRadius
	public var inputMaskImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self.inputAffineClampFilter.setDefaults()
		self.inputMaskedVariableBlurFilter.setDefaults()
		self.inputCropFilter.setDefaults()
		self.inputRadius = self.defaultRadius
		self.inputMaskImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		let affineClampFilter = self.inputAffineClampFilter
		let transform = CGAffineTransform(scaleX: 1, y: 1)
		affineClampFilter.setValue(inputImage, forKey: kCIInputImageKey)
		affineClampFilter.setValue(transform, forKey: kCIInputTransformKey)
		guard let affineClampedImage = affineClampFilter.outputImage else {
			return inputImage
		}
		
		let maskedVariableBlurFilter = self.inputMaskedVariableBlurFilter
		let maskImage = self.inputMaskImage
		let radius = self.inputRadius
		maskedVariableBlurFilter.setValue(affineClampedImage, forKey: kCIInputImageKey)
		maskedVariableBlurFilter.setValue(maskImage, forKey: "inputMask")
		maskedVariableBlurFilter.setValue(radius, forKey: kCIInputRadiusKey)
		guard let blurredImage = maskedVariableBlurFilter.outputImage else {
			return affineClampedImage.cropping(to: inputImage.extent)
		}
		
		let cropFilter = self.inputCropFilter
		let originalRect = inputImage.extent
		cropFilter.setValue(blurredImage, forKey: kCIInputImageKey)
		cropFilter.setValue(originalRect, forKey: "inputRectangle")
		guard let croppedImage = cropFilter.outputImage else {
			return blurredImage.cropping(to: inputImage.extent)
		}
		
		return croppedImage
		
	}
	
}
