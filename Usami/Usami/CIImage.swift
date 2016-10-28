//
//  CIImage.swift
//  Usami
//
//  Created by 史　翔新 on 2016/10/28.
//  Copyright © 2016年 net.crazism. All rights reserved.
//

import CoreImage

extension CIImage {
	
	public static func createImageWithExtent(_ extent: CGRect, andColor color: CIColor) -> CIImage? {
		
		guard let generator = CIFilter(name: "CIConstantColorGenerator") else {
			return nil
		}
		
		generator.setValue(color, forKey: kCIInputColorKey)
		let croppedImage = generator.outputImage?.cropping(to: extent)
		
		return croppedImage
		
	}
	
}
