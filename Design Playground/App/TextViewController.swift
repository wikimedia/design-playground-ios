import UIKit

final class TextViewController: UIViewController {

	// MARK: - Properties

	lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.alwaysBounceVertical = true
		return scrollView
	}()

	lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.spacing = 5
		return stackView
	}()

	// MARK: - Lifecycle

	override func loadView() {
		let contentView = UIView(frame: UIScreen.main.bounds)
		contentView.backgroundColor = .systemBackground

		contentView.addSubview(scrollView)
		scrollView.addSubview(stackView)

		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: contentView.readableContentGuide.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: contentView.readableContentGuide.bottomAnchor),
			scrollView.leadingAnchor.constraint(equalTo: contentView.readableContentGuide.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: contentView.readableContentGuide.trailingAnchor),

			stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
		])

		self.view = contentView

		addUIElements()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Text"
	}

}

extension TextViewController {

	func addUIElements() {
		// NOTE: A fixed font size label that doesn't scale with Dynamic Type
		let fixedFontLabel = UILabel()
		fixedFontLabel.numberOfLines = 0
		fixedFontLabel.text = "Custom Fixed Font"
		fixedFontLabel.adjustsFontForContentSizeCategory = true
		fixedFontLabel.font = UIFont.monospacedSystemFont(ofSize: 20, weight: .bold)
		stackView.addArrangedSubview(fixedFontLabel)
		stackView.addArrangedSubview(VerticalSpacerView.spacerWith(space: 15, backgroundColor: .systemGroupedBackground))

		// NOTE: A custom scaled font that scales with Dynamic Type per the specified Text Style
		let scaledFontLabel = UILabel()
		scaledFontLabel.text = "Custom Scaled Font matching `body` text style's scaling metrics"
		scaledFontLabel.numberOfLines = 0
		scaledFontLabel.adjustsFontForContentSizeCategory = true
		scaledFontLabel.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont.systemFont(ofSize: 15, weight: .bold), maximumPointSize: 64)
		stackView.addArrangedSubview(scaledFontLabel)
		stackView.addArrangedSubview(VerticalSpacerView.spacerWith(space: 15, backgroundColor: .systemGroupedBackground))

		// NOTE: System available Text Styles that scale with Dynamic Type
		for style in UIFont.TextStyle.allCases {
			let label = UILabel()
			label.numberOfLines = 0
			label.text = "System (\(style.name))"
			label.font = UIFont.preferredFont(forTextStyle: style)
			label.isUserInteractionEnabled = true
			label.adjustsFontForContentSizeCategory = true
			stackView.addArrangedSubview(label)
		}
	}

}
