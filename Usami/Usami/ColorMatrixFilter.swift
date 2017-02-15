//
//  ColorMatrixFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2017/02/15.
//  Copyright © 2017年 net.crazism. All rights reserved.
//

import CoreImage

public class ColorMatrixFilter: CustomImageRetouchCIFilter {
	
	private let _colorMatrixFilter: CIFilter = {
		guard let filter = CIFilter(name: "CIColorMatrix") else {
			fatalError("CIColorMatrix filter not exist")
		}
		return filter
	}()
	
	public var inputR = CIVector(x: 1, y: 0, z: 0, w: 0)
	public var inputG = CIVector(x: 0, y: 1, z: 0, w: 0)
	public var inputB = CIVector(x: 0, y: 0, z: 1, w: 0)
	public var inputA = CIVector(x: 0, y: 0, z: 0, w: 1)
	public var inputBias = CIVector(x: 0, y: 0, z: 0, w: 0)
	
	public override func setDefaults() {
		super.setDefaults()
		self.inputR = CIVector(x: 1, y: 0, z: 0, w: 0)
		self.inputG = CIVector(x: 0, y: 1, z: 0, w: 0)
		self.inputB = CIVector(x: 0, y: 0, z: 1, w: 0)
		self.inputA = CIVector(x: 0, y: 0, z: 0, w: 1)
		self.inputBias = CIVector(x: 0, y: 0, z: 0, w: 0)
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		let colorMatrixFilter = self._colorMatrixFilter
		let inputR = self.inputR
		let inputG = self.inputG
		let inputB = self.inputB
		let inputA = self.inputA
		let inputBias = self.inputBias
		
		colorMatrixFilter.setValue(inputImage, forKey: kCIInputImageKey)
		colorMatrixFilter.setValue(inputR, forKey: "inputRVector")
		colorMatrixFilter.setValue(inputG, forKey: "inputGVector")
		colorMatrixFilter.setValue(inputB, forKey: "inputBVector")
		colorMatrixFilter.setValue(inputA, forKey: "inputAVector")
		colorMatrixFilter.setValue(inputBias, forKey: "inputBiasVector")
		
		guard let colorMatrixedImage = colorMatrixFilter.outputImage else {
			return inputImage
		}
		
		return colorMatrixedImage
		
	}
	
}
