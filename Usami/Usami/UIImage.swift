//
//  UIImage.swift
//  Usami
//
//  Created by 史　翔新 on 2017/09/15.
//  Copyright © 2017年 net.crazism. All rights reserved.
//

import UIKit

extension UIImage {
	
	func resized(to size: CGSize) -> UIImage? {
		
		UIGraphicsBeginImageContextWithOptions(size, false, self.scale)
		
		let drawingRect = CGRect(origin: .zero, size: size)
		self.draw(in: drawingRect)
		let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return resizedImage
		
	}
	
	func cropped(in rect: CGRect, onColor canvasColor: UIColor = .clear) -> UIImage? {
		
		let opaque = canvasColor != .clear
		
		UIGraphicsBeginImageContextWithOptions(rect.size, opaque, self.scale)
		guard let context = UIGraphicsGetCurrentContext() else {
			return nil
		}
		
		if opaque {
			context.setFillColor(canvasColor.cgColor)
			context.fill(CGRect(origin: .zero, size: rect.size))
		}
		
		let drawPoint = rect.origin.negated
		self.draw(at: drawPoint)
		let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return croppedImage
		
	}
	
}
