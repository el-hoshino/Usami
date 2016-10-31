//
//  CIImage.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/28.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

extension CIImage {
	
	public static func createImageWithExtent(_ extent: CGRect, andColor color: CIColor) -> CIImage? {
		
		guard let generator = CIFilter(name: "CIConstantColorGenerator") else {
			return nil
		}
		
		generator.setValue(color, forKey: kCIInputColorKey)
		let croppedImage = generator.outputImage?.cropping(to: extent)
		
		return croppedImage
		
	}
	
	public static func createRadialGradientImageWithExtent(_ extent: CGRect, circleCenter: CGPoint, innerRadius: CGFloat, innerColor: CIColor, outerRadius: CGFloat, outerColor: CIColor) -> CIImage? {
		
		guard let generator = CIFilter(name: "CIRadialGradient") else {
			return nil
		}
		
		let centerVector = CIVector(cgPoint: circleCenter)
		generator.setValue(centerVector, forKey: kCIInputCenterKey)
		generator.setValue(innerRadius, forKey: "inputRadius0")
		generator.setValue(outerRadius, forKey: "inputRadius1")
		generator.setValue(innerColor, forKey: "inputColor0")
		generator.setValue(outerColor, forKey: "inputColor1")
		let croppedImage = generator.outputImage?.cropping(to: extent)
		
		return croppedImage
		
	}
	
}
