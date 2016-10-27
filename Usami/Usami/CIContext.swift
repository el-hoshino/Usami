//
//  CIContext.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/27.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

extension CIContext {
	
	public func createImage(_ ciImage: CIImage, from rect: CGRect? = nil) -> UIImage? {
		
		if let cgImage = self.createCGImage(ciImage, from: rect ?? ciImage.extent) {
			return UIImage(cgImage: cgImage)
			
		} else {
			return nil
			
		}
		
	}
	
}
