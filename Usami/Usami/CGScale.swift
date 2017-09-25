//
//  CGScale.swift
//  Usami
//
//  Created by 史　翔新 on 2017/09/25.
//  Copyright © 2017年 net.crazism. All rights reserved.
//

import Foundation

public struct CGScale {
	
	public var horizontal: CGFloat
	
	public var vertical: CGFloat
	
	public init(horizontal: CGFloat, vertical: CGFloat) {
		self.horizontal = horizontal
		self.vertical = vertical
	}
	
}

extension CGScale {
	
	public init(scale: CGFloat = 0) {
		self.horizontal = scale
		self.vertical = scale
	}
	
}

extension CGScale {
	
	public static let zero: CGScale = CGScale()
	
	public static let identity = CGScale(horizontal: 1, vertical: 1)
	
}
