//
//  ColorMatrixFilter.swift
//  Usami
//
//  Created by 史　翔新 on 2017/02/15.
//  Copyright © 2017年 net.crazism. All rights reserved.
//

import CoreImage

public class ColorMatrixFilter: CustomImageRetouchCIFilter {
	
	private let inputColorMatrixFilter: CIFilter = {
		guard let filter = CIFilter(name: "CIColorMatrix") else {
			fatalError("CIColorMatrix filter not exist")
		}
		return filter
	}()
	
	private var defaultR: CIVector { return CIVector(x: 1, y: 0, z: 0, w: 0) }
	private var defaultG: CIVector { return CIVector(x: 0, y: 1, z: 0, w: 0) }
	private var defaultB: CIVector { return CIVector(x: 0, y: 0, z: 1, w: 0) }
	private var defaultA: CIVector { return CIVector(x: 0, y: 0, z: 0, w: 1) }
	private var defaultBias: CIVector { return CIVector(x: 0, y: 0, z: 0, w: 0) }
	
	public lazy var inputR: CIVector = self.defaultR
	public lazy var inputG: CIVector = self.defaultG
	public lazy var inputB: CIVector = self.defaultB
	public lazy var inputA: CIVector = self.defaultA
	public lazy var inputBias: CIVector = self.defaultBias
	
	public override func setDefaults() {
		super.setDefaults()
		self.inputR = self.defaultR
		self.inputG = self.defaultG
		self.inputB = self.defaultB
		self.inputA = self.defaultA
		self.inputBias = self.defaultBias
	}
	
	public override var outputImage: CIImage? {
		
		guard let inputImage = self.inputImage else {
			return nil
		}
		
		let colorMatrixFilter = self.inputColorMatrixFilter
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
