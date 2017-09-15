//
//  CGPoint.swift
//  Usami
//
//  Created by 史　翔新 on 2017/09/15.
//  Copyright © 2017年 net.crazism. All rights reserved.
//

import Foundation

extension CGPoint {
	
	var negated: CGPoint {
		return CGPoint(x: -self.x, y: -self.y)
	}
	
}
