//
//  GaussianBlurFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/27.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class GaussianBlurFilter: CustomImageRetouchCIFilter {
	
	private let inputAffineClampFilter: CIFilter = {
		guard let filter = CIFilter(name: "CIAffineClamp") else {
			fatalError("CIAffineClamp filter not exist")
		}
		return filter
	}()
	private let inputGaussianBlurFilter: CIFilter = {
		guard let filter = CIFilter(name: "CIGaussianBlur") else {
			fatalError("CIGaussianBlur filter not exist")
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
	
	public override func setDefaults() {
		super.setDefaults()
		self.inputAffineClampFilter.setDefaults()
		self.inputGaussianBlurFilter.setDefaults()
		self.inputCropFilter.setDefaults()
		self.inputRadius = self.defaultRadius
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
		
		let gaussianBlurFilter = self.inputGaussianBlurFilter
		let radius = self.inputRadius
		gaussianBlurFilter.setValue(affineClampedImage, forKey: kCIInputImageKey)
		gaussianBlurFilter.setValue(radius, forKey: kCIInputRadiusKey)
		guard let blurredImage = gaussianBlurFilter.outputImage else {
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
