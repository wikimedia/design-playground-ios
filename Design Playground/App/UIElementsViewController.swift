import UIKit

final class UIElementsViewController: UIViewController {

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
		stackView.spacing = 25
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
		title = "UI"

		let leftButton = UIBarButtonItem(title: "Enabled", style: .plain, target: nil, action: nil)
		let rightButton = UIBarButtonItem(title: "Disabled", style: .plain, target: nil, action: nil)

		navigationItem.leftBarButtonItem = leftButton
		navigationItem.rightBarButtonItem = rightButton

		rightButton.isEnabled = false
	}

}


fileprivate extension UIElementsViewController {

	func addUIElements() {
		// NOTE: Dynamic label with lorem ipsum
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .preferredFont(forTextStyle: .body)
		label.adjustsFontForContentSizeCategory = true
		label.text = SampleData.loremIpsum
		stackView.addArrangedSubview(label)

		// NOTE: An on/off switch
		let toggle = UISwitch()
		stackView.addArrangedSubview(toggle)

		// NOTE: A search field
		let searchField = UISearchTextField()
		stackView.addArrangedSubview(searchField)

		// NOTE: A standard button, in the enabled state
		let enabledButton = UIButton(type: .system)
		enabledButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
		enabledButton.titleLabel?.adjustsFontForContentSizeCategory = true
		enabledButton.setTitle("Enabled Button", for: .normal)
		stackView.addArrangedSubview(enabledButton)

		// NOTE: A standard button, in the disabled state
		let disabledButton = UIButton(type: .system)
		disabledButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
		disabledButton.titleLabel?.adjustsFontForContentSizeCategory = true
		disabledButton.setTitle("Disabled Button", for: .normal)
		disabledButton.isEnabled = false
		stackView.addArrangedSubview(disabledButton)

		// NOTE: A standard button with a background fill color
		let backgroundColorLabel = UIButton(type: .system)
		backgroundColorLabel.titleLabel?.font = .preferredFont(forTextStyle: .body)
		backgroundColorLabel.titleLabel?.adjustsFontForContentSizeCategory = true
		backgroundColorLabel.setTitle("Background Color Button", for: .normal)
		backgroundColorLabel.backgroundColor = UIColor.systemFill
		stackView.addArrangedSubview(backgroundColorLabel)
	}

}
