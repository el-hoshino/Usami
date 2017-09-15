//
//  CGFloat.swift
//  Usami
//
//  Created by 史　翔新 on 2017/09/15.
//  Copyright © 2017年 net.crazism. All rights reserved.
//

import Foundation

extension CGFloat {
	
	func limited(within range: ClosedRange<CGFloat>) -> CGFloat {
		
		switch self {
		case -.infinity ... range.lowerBound:
			return range.lowerBound
			
		case range.upperBound ... .infinity:
			return range.upperBound
			
		default:
			return self
		}
		
	}
	
}
