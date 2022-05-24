import UIKit

class VerticalSpacerView: UIView {

	// MARK: - Properties

	var space: CGFloat = 0 {
		didSet {
			spaceHeightAnchor?.constant = space
		}
	}

	fileprivate var spaceHeightAnchor: NSLayoutConstraint?


	// MARK: - Lifecycle

	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}

	required init?(coder: NSCoder) {
		fatalError()
	}


	// MARK: - Setup

	func setup() {
		spaceHeightAnchor = heightAnchor.constraint(equalToConstant: space)
		spaceHeightAnchor?.isActive = true
	}

	// MARK: - Factory

	static func spacerWith(space: CGFloat, backgroundColor: UIColor) -> VerticalSpacerView {
		let spacer = VerticalSpacerView()
		spacer.space = space
		spacer.backgroundColor = backgroundColor
		return spacer
	}

	static func spacerWith(space: CGFloat) -> VerticalSpacerView {
		let spacer = VerticalSpacerView()
		spacer.space = space
		return spacer
	}

}
