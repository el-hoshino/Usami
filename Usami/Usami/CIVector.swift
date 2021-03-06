//
//  CIVector.swift
//  Usami
//
//  Created by 史　翔新 on 2017/02/08.
//  Copyright © 2017年 net.crazism. All rights reserved.
//

import CoreImage

extension CIVector {
	
	public convenience init(cgVector v: CGVector) {
		self.init(cgPoint: CGPoint(x: v.dx, y: v.dy))
	}
	
}

extension CIVector {
	
	public static var zero: CIVector {
		return CIVector(x: 0, y: 0, z: 0, w: 0)
	}
	
}
