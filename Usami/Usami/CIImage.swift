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
		
		generator.inputExtent = extent
		generator.inputRadialCenter = CIVector(cgPoint: circleCenter)
		generator.inputInnerRadius = innerRadius
		generator.inputInnerColor = innerColor
		generator.inputOuterRadius = outerRadius
		generator.inputOuterColor = outerColor
		let generatedImage = generator.outputImage
		
		return generatedImage
		
	}
	
}

extension CIImage {
	
	public func translating(by translation: CGPoint) -> CIImage {
		
		let transform = CGAffineTransform(translationX: translation.x, y: translation.y)
		let transformedImage = self.applying(transform)
		return transformedImage
		
	}
	
	public func scaling(by scale: CGScale) -> CIImage {
		
		let transform = CGAffineTransform(scaleX: scale.horizontal, y: scale.vertical)
		let transformedImage = self.applying(transform)
		return transformedImage
		
	}
	
	public func rotating(by angle: CGFloat) -> CIImage {
		
		let transform = CGAffineTransform(rotationAngle: angle)
		let transformedImage = self.applying(transform)
		return transformedImage
		
	}
	
}
