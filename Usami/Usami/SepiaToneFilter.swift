//
//  SepiaToneFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/27.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

public class SepiaToneFilter: CustomCIFilter {
	
	public override var customFilter: CIFilter? {
		
		guard let filter = CIFilter(name: "CISepiaTone") else {
			return nil
		}
		
		filter.setValue(self.inputImage, forKey: kCIInputImageKey)
		
		return filter
		
	}
	
}

