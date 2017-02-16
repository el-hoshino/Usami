//
//  CIFilter.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/26.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import CoreImage

extension CIFilter {
	
	@available(*, deprecated: 0.2.0, message: "CIFilter#getFilteredImage(from originalImage: UIImage?, in context: CIContext? = nil) is deprecated. Use CustomImageRetouchCIFilter#getRetouchedImage(from originalImage: UIImage?, in context: CIContext? = nil) instead.")
	public func getFilteredImage(from originalImage: UIImage?, in context: CIContext? = nil) -> UIImage? {
		
		guard let originalImage = originalImage else {
			return nil
		}
		
		guard let originalCIImage = originalImage.ciImage ?? CIImage(image: originalImage) else {
			return originalImage
		}
		
		self.setValue(originalCIImage, forKey: kCIInputImageKey)
		
		guard let outputCIImage = self.outputImage else {
			return originalImage
		}
		
		if let context = context, let outputCGImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) {
			return UIImage(cgImage: outputCGImage)
			
		} else {
			return UIImage(ciImage: outputCIImage)
			
		}
		
	}
	
}

extension CIFilter {
	
	public struct CICategory {
		
	}
	
}

extension CIFilter.CICategory {
	
	public struct Blur {
		
		public static func makeBoxBlur() -> CIFilter { return CIFilter(name: "CIBoxBlur")! }
		public static func makeDiscBlur() -> CIFilter { return CIFilter(name: "CIDiscBlur")! }
		public static func makeGaussianBlur() -> CIFilter { return CIFilter(name: "CIGaussianBlur")! }
		public static func makeMaskedVariableBlur() -> CIFilter { return CIFilter(name: "CIMaskedVariableBlur")! }
		public static func makeMedianFilter() -> CIFilter { return CIFilter(name: "CIMedianFilter")! }
		public static func makeMotionBlur() -> CIFilter { return CIFilter(name: "CIMotionBlur")! }
		public static func makeNoiseReduction() -> CIFilter { return CIFilter(name: "CINoiseReduction")! }
		public static func makeZoomBlur() -> CIFilter { return CIFilter(name: "CIZoomBlur")! }
		
	}
	
}

extension CIFilter.CICategory {
	
	public struct ColorAdjustment {
		
		public static func makeColorClamp() -> CIFilter { return CIFilter(name:"CIColorClamp")! }
		public static func makeColorControls() -> CIFilter { return CIFilter(name:"CIColorControls")! }
		public static func makeColorMatrix() -> CIFilter { return CIFilter(name:"CIColorMatrix")! }
		public static func makeColorPolynomial() -> CIFilter { return CIFilter(name:"CIColorPolynomial")! }
		public static func makeExposureAdjust() -> CIFilter { return CIFilter(name:"CIExposureAdjust")! }
		public static func makeGammaAdjust() -> CIFilter { return CIFilter(name:"CIGammaAdjust")! }
		public static func makeHueAdjust() -> CIFilter { return CIFilter(name:"CIHueAdjust")! }
		public static func makeLinearToSRGBToneCurve() -> CIFilter { return CIFilter(name:"CILinearToSRGBToneCurve")! }
		public static func makeSRGBToneCurveToLinear() -> CIFilter { return CIFilter(name:"CISRGBToneCurveToLinear")! }
		public static func makeTemperatureAndTint() -> CIFilter { return CIFilter(name:"CITemperatureAndTint")! }
		public static func makeToneCurve() -> CIFilter { return CIFilter(name:"CIToneCurve")! }
		public static func makeVibrance() -> CIFilter { return CIFilter(name:"CIVibrance")! }
		public static func makeWhitePointAdjust() -> CIFilter { return CIFilter(name:"CIWhitePointAdjust")! }
		
	}
	
}

extension CIFilter.CICategory {
	
	public struct ColorEffect {
		
		public static func makeColorCrossPolynomial() -> CIFilter { return CIFilter(name: "CIColorCrossPolynomial")! }
		public static func makeColorCube() -> CIFilter { return CIFilter(name: "CIColorCube")! }
		public static func makeColorCubeWithColorSpace() -> CIFilter { return CIFilter(name: "CIColorCubeWithColorSpace")! }
		public static func makeColorInvert() -> CIFilter { return CIFilter(name: "CIColorInvert")! }
		public static func makeColorMap() -> CIFilter { return CIFilter(name: "CIColorMap")! }
		public static func makeColorMonochrome() -> CIFilter { return CIFilter(name: "CIColorMonochrome")! }
		public static func makeColorPosterize() -> CIFilter { return CIFilter(name: "CIColorPosterize")! }
		public static func makeFalseColor() -> CIFilter { return CIFilter(name: "CIFalseColor")! }
		public static func makeMaskToAlpha() -> CIFilter { return CIFilter(name: "CIMaskToAlpha")! }
		public static func makeMaximumComponent() -> CIFilter { return CIFilter(name: "CIMaximumComponent")! }
		public static func makeMinimumComponent() -> CIFilter { return CIFilter(name: "CIMinimumComponent")! }
		public static func makePhotoEffectChrome() -> CIFilter { return CIFilter(name: "CIPhotoEffectChrome")! }
		public static func makePhotoEffectFade() -> CIFilter { return CIFilter(name: "CIPhotoEffectFade")! }
		public static func makePhotoEffectInstant() -> CIFilter { return CIFilter(name: "CIPhotoEffectInstant")! }
		public static func makePhotoEffectMono() -> CIFilter { return CIFilter(name: "CIPhotoEffectMono")! }
		public static func makePhotoEffectNoir() -> CIFilter { return CIFilter(name: "CIPhotoEffectNoir")! }
		public static func makePhotoEffectProcess() -> CIFilter { return CIFilter(name: "CIPhotoEffectProcess")! }
		public static func makePhotoEffectTonal() -> CIFilter { return CIFilter(name: "CIPhotoEffectTonal")! }
		public static func makePhotoEffectTransfer() -> CIFilter { return CIFilter(name: "CIPhotoEffectTransfer")! }
		public static func makeSepiaTone() -> CIFilter { return CIFilter(name: "CISepiaTone")! }
		public static func makeVignette() -> CIFilter { return CIFilter(name: "CIVignette")! }
		public static func makeVignetteEffect() -> CIFilter { return CIFilter(name: "CIVignetteEffect")! }
		
	}
}

extension CIFilter.CICategory {
	
	public struct CompositeOperation {
		
		public static func makeAdditionCompositing() -> CIFilter { return CIFilter(name: "CIAdditionCompositing")! }
		public static func makeColorBlendMode() -> CIFilter { return CIFilter(name: "CIColorBlendMode")! }
		public static func makeColorBurnBlendMode() -> CIFilter { return CIFilter(name: "CIColorBurnBlendMode")! }
		public static func makeColorDodgeBlendMode() -> CIFilter { return CIFilter(name: "CIColorDodgeBlendMode")! }
		public static func makeDarkenBlendMode() -> CIFilter { return CIFilter(name: "CIDarkenBlendMode")! }
		public static func makeDifferenceBlendMode() -> CIFilter { return CIFilter(name: "CIDifferenceBlendMode")! }
		public static func makeDivideBlendMode() -> CIFilter { return CIFilter(name: "CIDivideBlendMode")! }
		public static func makeExclusionBlendMode() -> CIFilter { return CIFilter(name: "CIExclusionBlendMode")! }
		public static func makeHardLightBlendMode() -> CIFilter { return CIFilter(name: "CIHardLightBlendMode")! }
		public static func makeHueBlendMode() -> CIFilter { return CIFilter(name: "CIHueBlendMode")! }
		public static func makeLightenBlendMode() -> CIFilter { return CIFilter(name: "CILightenBlendMode")! }
		public static func makeLinearBurnBlendMode() -> CIFilter { return CIFilter(name: "CILinearBurnBlendMode")! }
		public static func makeLinearDodgeBlendMode() -> CIFilter { return CIFilter(name: "CILinearDodgeBlendMode")! }
		public static func makeLuminosityBlendMode() -> CIFilter { return CIFilter(name: "CILuminosityBlendMode")! }
		public static func makeMaximumCompositing() -> CIFilter { return CIFilter(name: "CIMaximumCompositing")! }
		public static func makeMinimumCompositing() -> CIFilter { return CIFilter(name: "CIMinimumCompositing")! }
		public static func makeMultiplyBlendMode() -> CIFilter { return CIFilter(name: "CIMultiplyBlendMode")! }
		public static func makeMultiplyCompositing() -> CIFilter { return CIFilter(name: "CIMultiplyCompositing")! }
		public static func makeOverlayBlendMode() -> CIFilter { return CIFilter(name: "CIOverlayBlendMode")! }
		public static func makePinLightBlendMode() -> CIFilter { return CIFilter(name: "CIPinLightBlendMode")! }
		public static func makeSaturationBlendMode() -> CIFilter { return CIFilter(name: "CISaturationBlendMode")! }
		public static func makeScreenBlendMode() -> CIFilter { return CIFilter(name: "CIScreenBlendMode")! }
		public static func makeSoftLightBlendMode() -> CIFilter { return CIFilter(name: "CISoftLightBlendMode")! }
		public static func makeSourceAtopCompositing() -> CIFilter { return CIFilter(name: "CISourceAtopCompositing")! }
		public static func makeSourceInCompositing() -> CIFilter { return CIFilter(name: "CISourceInCompositing")! }
		public static func makeSourceOutCompositing() -> CIFilter { return CIFilter(name: "CISourceOutCompositing")! }
		public static func makeSourceOverCompositing() -> CIFilter { return CIFilter(name: "CISourceOverCompositing")! }
		public static func makeSubtractBlendMode() -> CIFilter { return CIFilter(name: "CISubtractBlendMode")! }
		
	}
	
}

extension CIFilter.CICategory {
	
	public struct DistortionEffect {
		
		public static func makeBumpDistortion() -> CIFilter { return CIFilter(name: "CIBumpDistortion")! }
		public static func makeBumpDistortionLinear() -> CIFilter { return CIFilter(name: "CIBumpDistortionLinear")! }
		public static func makeCircleSplashDistortion() -> CIFilter { return CIFilter(name: "CICircleSplashDistortion")! }
		public static func makeCircularWrap() -> CIFilter { return CIFilter(name: "CICircularWrap")! }
		public static func makeDroste() -> CIFilter { return CIFilter(name: "CIDroste")! }
		public static func makeDisplacementDistortion() -> CIFilter { return CIFilter(name: "CIDisplacementDistortion")! }
		public static func makeGlassDistortion() -> CIFilter { return CIFilter(name: "CIGlassDistortion")! }
		public static func makeGlassLozenge() -> CIFilter { return CIFilter(name: "CIGlassLozenge")! }
		public static func makeHoleDistortion() -> CIFilter { return CIFilter(name: "CIHoleDistortion")! }
		public static func makeLightTunnel() -> CIFilter { return CIFilter(name: "CILightTunnel")! }
		public static func makePinchDistortion() -> CIFilter { return CIFilter(name: "CIPinchDistortion")! }
		public static func makeStretchCrop() -> CIFilter { return CIFilter(name: "CIStretchCrop")! }
		public static func makeTorusLensDistortion() -> CIFilter { return CIFilter(name: "CITorusLensDistortion")! }
		public static func makeTwirlDistortion() -> CIFilter { return CIFilter(name: "CITwirlDistortion")! }
		public static func makeVortexDistortion() -> CIFilter { return CIFilter(name: "CIVortexDistortion")! }
		
	}
	
}

extension CIFilter.CICategory {
	
	public struct Generator {
		
		public static func makeAztecCodeGenerator() -> CIFilter { return CIFilter(name: "CIAztecCodeGenerator")! }
		public static func makeCheckerboardGenerator() -> CIFilter { return CIFilter(name: "CICheckerboardGenerator")! }
		public static func makeCode128BarcodeGenerator() -> CIFilter { return CIFilter(name: "CICode128BarcodeGenerator")! }
		public static func makeConstantColorGenerator() -> CIFilter { return CIFilter(name: "CIConstantColorGenerator")! }
		public static func makeLenticularHaloGenerator() -> CIFilter { return CIFilter(name: "CILenticularHaloGenerator")! }
		public static func makePDF417BarcodeGenerator() -> CIFilter { return CIFilter(name: "CIPDF417BarcodeGenerator")! }
		public static func makeQRCodeGenerator() -> CIFilter { return CIFilter(name: "CIQRCodeGenerator")! }
		public static func makeRandomGenerator() -> CIFilter { return CIFilter(name: "CIRandomGenerator")! }
		public static func makeStarShineGenerator() -> CIFilter { return CIFilter(name: "CIStarShineGenerator")! }
		public static func makeStripesGenerator() -> CIFilter { return CIFilter(name: "CIStripesGenerator")! }
		public static func makeSunbeamsGenerator() -> CIFilter { return CIFilter(name: "CISunbeamsGenerator")! }
		
	}
	
}

extension CIFilter.CICategory {
	
	public struct GeometryAdjustment {
		
		public static func makeAffineTransform() -> CIFilter { return CIFilter(name: "CIAffineTransform")! }
		public static func makeCrop() -> CIFilter { return CIFilter(name: "CICrop")! }
		public static func makeLanczosScaleTransform() -> CIFilter { return CIFilter(name: "CILanczosScaleTransform")! }
		public static func makePerspectiveCorrection() -> CIFilter { return CIFilter(name: "CIPerspectiveCorrection")! }
		public static func makePerspectiveTransform() -> CIFilter { return CIFilter(name: "CIPerspectiveTransform")! }
		public static func makePerspectiveTransformWithExtent() -> CIFilter { return CIFilter(name: "CIPerspectiveTransformWithExtent")! }
		public static func makeStraightenFilter() -> CIFilter { return CIFilter(name: "CIStraightenFilter")! }
		
	}
	
}

extension CIFilter.CICategory {
	
	public struct Gradient {
		
		public static func makeGaussianGradient() -> CIFilter { return CIFilter(name: "CIGaussianGradient")! }
		public static func makeLinearGradient() -> CIFilter { return CIFilter(name: "CILinearGradient")! }
		public static func makeRadialGradient() -> CIFilter { return CIFilter(name: "CIRadialGradient")! }
		public static func makeSmoothLinearGradient() -> CIFilter { return CIFilter(name: "CISmoothLinearGradient")! }
		
	}
	
}

extension CIFilter.CICategory {
	
	public struct HalftoneEffect {
		
		public static func makeCircularScreen() -> CIFilter { return CIFilter(name: "CICircularScreen")! }
		public static func makeCMYKHalftone() -> CIFilter { return CIFilter(name: "CICMYKHalftone")! }
		public static func makeDotScreen() -> CIFilter { return CIFilter(name: "CIDotScreen")! }
		public static func makeHatchedScreen() -> CIFilter { return CIFilter(name: "CIHatchedScreen")! }
		public static func makeLineScreen() -> CIFilter { return CIFilter(name: "CILineScreen")! }
		
	}
	
}

extension CIFilter.CICategory {
	
	public struct Reduction {
		
		public static func makeAreaAverage() -> CIFilter { return CIFilter(name: "CIAreaAverage")! }
		public static func makeAreaHistogram() -> CIFilter { return CIFilter(name: "CIAreaHistogram")! }
		public static func makeRowAverage() -> CIFilter { return CIFilter(name: "CIRowAverage")! }
		public static func makeColumnAverage() -> CIFilter { return CIFilter(name: "CIColumnAverage")! }
		public static func makeHistogramDisplayFilter() -> CIFilter { return CIFilter(name: "CIHistogramDisplayFilter")! }
		public static func makeAreaMaximum() -> CIFilter { return CIFilter(name: "CIAreaMaximum")! }
		public static func makeAreaMinimum() -> CIFilter { return CIFilter(name: "CIAreaMinimum")! }
		public static func makeAreaMaximumAlpha() -> CIFilter { return CIFilter(name: "CIAreaMaximumAlpha")! }
		public static func makeAreaMinimumAlpha() -> CIFilter { return CIFilter(name: "CIAreaMinimumAlpha")! }
		
	}
	
}

extension CIFilter.CICategory {
	
	public struct Sharpen {
		
		public static func makeSharpenLuminance() -> CIFilter { return CIFilter(name: "CIAreaAverage")! }
		public static func makeUnsharpMask() -> CIFilter { return CIFilter(name: "CIAreaHistogram")! }
		
	}
	
}

extension CIFilter.CICategory {
	
	public struct Stylize {
		
		public static func makeBlendWithAlphaMask() -> CIFilter { return CIFilter(name: "CIBlendWithAlphaMask")! }
		public static func makeBlendWithMask() -> CIFilter { return CIFilter(name: "CIBlendWithMask")! }
		public static func makeBloom() -> CIFilter { return CIFilter(name: "CIBloom")! }
		public static func makeComicEffect() -> CIFilter { return CIFilter(name: "CIComicEffect")! }
		public static func makeConvolution3X3() -> CIFilter { return CIFilter(name: "CIConvolution3X3")! }
		public static func makeConvolution5X5() -> CIFilter { return CIFilter(name: "CIConvolution5X5")! }
		public static func makeConvolution7X7() -> CIFilter { return CIFilter(name: "CIConvolution7X7")! }
		public static func makeConvolution9Horizontal() -> CIFilter { return CIFilter(name: "CIConvolution9Horizontal")! }
		public static func makeConvolution9Vertical() -> CIFilter { return CIFilter(name: "CIConvolution9Vertical")! }
		public static func makeCrystallize() -> CIFilter { return CIFilter(name: "CICrystallize")! }
		public static func makeDepthOfField() -> CIFilter { return CIFilter(name: "CIDepthOfField")! }
		public static func makeEdges() -> CIFilter { return CIFilter(name: "CIEdges")! }
		public static func makeEdgeWork() -> CIFilter { return CIFilter(name: "CIEdgeWork")! }
		public static func makeGloom() -> CIFilter { return CIFilter(name: "CIGloom")! }
		public static func makeHeightFieldFromMask() -> CIFilter { return CIFilter(name: "CIHeightFieldFromMask")! }
		public static func makeHexagonalPixellate() -> CIFilter { return CIFilter(name: "CIHexagonalPixellate")! }
		public static func makeHighlightShadowAdjust() -> CIFilter { return CIFilter(name: "CIHighlightShadowAdjust")! }
		public static func makeLineOverlay() -> CIFilter { return CIFilter(name: "CILineOverlay")! }
		public static func makePixellate() -> CIFilter { return CIFilter(name: "CIPixellate")! }
		public static func makePointillize() -> CIFilter { return CIFilter(name: "CIPointillize")! }
		public static func makeShadedMaterial() -> CIFilter { return CIFilter(name: "CIShadedMaterial")! }
		public static func makeSpotColor() -> CIFilter { return CIFilter(name: "CISpotColor")! }
		public static func makeSpotLight() -> CIFilter { return CIFilter(name: "CISpotLight")! }
		
	}
	
}

extension CIFilter.CICategory {
	
	public struct TileEffect {
		
		public static func makeAffineClamp() -> CIFilter { return CIFilter(name: "CIAffineClamp")! }
		public static func makeAffineTile() -> CIFilter { return CIFilter(name: "CIAffineTile")! }
		public static func makeEightfoldReflectedTile() -> CIFilter { return CIFilter(name: "CIEightfoldReflectedTile")! }
		public static func makeFourfoldReflectedTile() -> CIFilter { return CIFilter(name: "CIFourfoldReflectedTile")! }
		public static func makeFourfoldRotatedTile() -> CIFilter { return CIFilter(name: "CIFourfoldRotatedTile")! }
		public static func makeFourfoldTranslatedTile() -> CIFilter { return CIFilter(name: "CIFourfoldTranslatedTile")! }
		public static func makeGlideReflectedTile() -> CIFilter { return CIFilter(name: "CIGlideReflectedTile")! }
		public static func makeKaleidoscope() -> CIFilter { return CIFilter(name: "CIKaleidoscope")! }
		public static func makeOpTile() -> CIFilter { return CIFilter(name: "CIOpTile")! }
		public static func makeParallelogramTile() -> CIFilter { return CIFilter(name: "CIParallelogramTile")! }
		public static func makePerspectiveTile() -> CIFilter { return CIFilter(name: "CIPerspectiveTile")! }
		public static func makeSixfoldReflectedTile() -> CIFilter { return CIFilter(name: "CISixfoldReflectedTile")! }
		public static func makeSixfoldRotatedTile() -> CIFilter { return CIFilter(name: "CISixfoldRotatedTile")! }
		public static func makeTriangleKaleidoscope() -> CIFilter { return CIFilter(name: "CITriangleKaleidoscope")! }
		public static func makeTriangleTile() -> CIFilter { return CIFilter(name: "CITriangleTile")! }
		public static func makeTwelvefoldReflectedTile() -> CIFilter { return CIFilter(name: "CITwelvefoldReflectedTile")! }
		
	}
	
}

extension CIFilter.CICategory {
	
	public struct Transition {
		
		public static func makeAccordionFoldTransition() -> CIFilter { return CIFilter(name: "CIAccordionFoldTransition")! }
		public static func makeBarsSwipeTransition() -> CIFilter { return CIFilter(name: "CIBarsSwipeTransition")! }
		public static func makeCopyMachineTransition() -> CIFilter { return CIFilter(name: "CICopyMachineTransition")! }
		public static func makeDisintegrateWithMaskTransition() -> CIFilter { return CIFilter(name: "CIDisintegrateWithMaskTransition")! }
		public static func makeDissolveTransition() -> CIFilter { return CIFilter(name: "CIDissolveTransition")! }
		public static func makeFlashTransition() -> CIFilter { return CIFilter(name: "CIFlashTransition")! }
		public static func makeModTransition() -> CIFilter { return CIFilter(name: "CIModTransition")! }
		public static func makePageCurlTransition() -> CIFilter { return CIFilter(name: "CIPageCurlTransition")! }
		public static func makePageCurlWithShadowTransition() -> CIFilter { return CIFilter(name: "CIPageCurlWithShadowTransition")! }
		public static func makeRippleTransition() -> CIFilter { return CIFilter(name: "CIRippleTransition")! }
		public static func makeSwipeTransition() -> CIFilter { return CIFilter(name: "CISwipeTransition")! }
		
	}
	
}
