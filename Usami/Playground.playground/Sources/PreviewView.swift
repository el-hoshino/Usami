import UIKit

public class PreviewView: UIView {
	
	private let imageAView = UIImageView()
	private let imageBView = UIImageView()
	
	public var imageA: UIImage? {
		set {
			self.imageAView.image = newValue
		}
		get {
			return self.imageAView.image
		}
	}
	public var imageB: UIImage? {
		set {
			self.imageBView.image = newValue
		}
		get {
			return self.imageBView.image
		}
	}
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
		self.initialize()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.initialize()
	}
	
	private func initialize() {
		
		func prepareSubview(_ view: UIView) {
			view.contentMode = .scaleAspectFit
			self.addSubview(view)
		}
		
		prepareSubview(self.imageAView)
		prepareSubview(self.imageBView)
		
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		
		let halfWidth = self.frame.width / 2
		let imageViewSize = CGSize(width: halfWidth, height: self.frame.height)
		let imageAViewOrigin = CGPoint.zero
		let imageBViewOrigin = CGPoint(x: halfWidth, y: 0)
		self.imageAView.frame = CGRect(origin: imageAViewOrigin, size: imageViewSize)
		self.imageBView.frame = CGRect(origin: imageBViewOrigin, size: imageViewSize)
		
	}
	
}
