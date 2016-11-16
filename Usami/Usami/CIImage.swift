//
//  CIImage.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/28.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage
import Eltaso

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
		
		let generator = RadialGradientGenerator()
		
		generator.extent = extent
		generator.radialCenter = CIVector(cgPoint: circleCenter)
		generator.innerRadius = innerRadius
		generator.innerColor = innerColor
		generator.outerRadius = outerRadius
		generator.outerColor = outerColor
		let generatedImage = generator.outputImage
		
		return generatedImage
		
		
	}
	
}
