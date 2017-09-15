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
	
	@available(*, deprecated: 0.2.0, message: "CIImage.createImageWithExtent(_ extent: CGRect, andColor color: CIColor) is deprecated. Use CIImage.createImage(extent: CGRect, color: CIColor) instead.")
	public static func createImageWithExtent(_ extent: CGRect, andColor color: CIColor) -> CIImage? {
		return CIImage.createImage(extent: extent, color: color)
	}
	
	public static func createImage(extent: CGRect, color: CIColor) -> CIImage? {
		
		guard let generator = CIFilter(name: "CIConstantColorGenerator") else {
			return nil
		}
		
		generator.setValue(color, forKey: kCIInputColorKey)
		let croppedImage = generator.outputImage?.cropped(to: extent)
		
		return croppedImage
		
	}
	
	@available(*, deprecated: 0.2.0, message: "CIImage.createRadialGradientImageWithExtent(_ extent: CGRect, ...) is deprecated. Use CIImage.createImage(extent: CGRect, ...) instead.")
	public static func createRadialGradientImageWithExtent(_ extent: CGRect, circleCenter: CGPoint, innerRadius: CGFloat, innerColor: CIColor, outerRadius: CGFloat, outerColor: CIColor) -> CIImage? {
		return CIImage.createImage(extent: extent, circleCenter: circleCenter, innerRadius: innerRadius, innerColor: innerColor, outerRadius: outerRadius, outerColor: outerColor)
	}
	
	public static func createImage(extent: CGRect, circleCenter: CGPoint, innerRadius: CGFloat, innerColor: CIColor, outerRadius: CGFloat, outerColor: CIColor) -> CIImage? {
		
		let generator = RadialGradientGenerator()
		
		generator.inputExtent = CIVector(cgRect: extent)
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
		let transformedImage = self.transformed(by: transform)
		return transformedImage
		
	}
	
	public func scaling(by scale: CGScale) -> CIImage {
		
		let transform = CGAffineTransform(scaleX: scale.horizontal, y: scale.vertical)
		let transformedImage = self.transformed(by: transform)
		return transformedImage
		
	}
	
	public func rotating(by angle: CGFloat) -> CIImage {
		
		let transform = CGAffineTransform(rotationAngle: angle)
		let transformedImage = self.transformed(by: transform)
		return transformedImage
		
	}
	
}
