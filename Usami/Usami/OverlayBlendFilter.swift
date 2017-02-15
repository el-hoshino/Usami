//
//  OverlayBlendFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/11/04.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class OverlayBlendFilter: CustomImageRetouchCIFilter {
	
	private let inputOverlayBlendFilter: CIFilter = {
		guard let filter = CIFilter(name: "CIOverlayBlendMode") else {
			fatalError("CIOverlayBlendMode filter not exist")
		}
		return filter
	}()
	
	public var inputBlendingImage: CIImage?
	
	public override func setDefaults() {
		super.setDefaults()
		self.inputOverlayBlendFilter.setDefaults()
		self.inputBlendingImage = nil
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		guard let blendingImage = self.inputBlendingImage else {
			return inputImage
		}
		
		let overlayBlendFilter = self.inputOverlayBlendFilter
		overlayBlendFilter.setValue(inputImage, forKey: kCIInputBackgroundImageKey)
		overlayBlendFilter.setValue(blendingImage, forKey: kCIInputImageKey)
		guard let blendedImage = overlayBlendFilter.outputImage else {
			return inputImage
		}
		
		return blendedImage
		
	}
	
}
