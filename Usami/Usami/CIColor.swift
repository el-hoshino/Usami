//
//  CIColor.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/31.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

extension CIColor {
	
	public static let clear = CIColor(red: 0, green: 0, blue: 0, alpha: 0)
	
	public static let white = CIColor(red: 1, green: 1, blue: 1)
	
	public static let black = CIColor(red: 0, green: 0, blue: 0)
	
}

extension CIColor {
	
	public convenience init(hexRGBAValue: UInt) {
		
		let hexRed = (hexRGBAValue & 0xFF000000) >> 24
		let hexGreen = (hexRGBAValue & 0x00FF0000) >> 16
		let hexBlue = (hexRGBAValue & 0x0000FF00) >> 8
		let hexAlpha = (hexRGBAValue & 0x000000FF) >> 0
		
		let red = CGFloat(hexRed) / CGFloat(UInt8.max)
		let green = CGFloat(hexGreen) / CGFloat(UInt8.max)
		let blue = CGFloat(hexBlue) / CGFloat(UInt8.max)
		let alpha = CGFloat(hexAlpha) / CGFloat(UInt8.max)
		
		self.init(red: red, green: green, blue: blue, alpha: alpha)
		
	}
	
}
