import UIKit

final class ColorsViewController: UIViewController {

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
		stackView.spacing = 20
		stackView.alignment = .fill
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
		title = "Colors"		
	}
	
}

fileprivate extension ColorsViewController {

	func addUIElements() {
		let dynamicHeader = UILabel()
		dynamicHeader.numberOfLines = 0
		dynamicHeader.text = "Dynamic Colors"
		dynamicHeader.font = UIFont.preferredFont(forTextStyle: .headline)
		dynamicHeader.adjustsFontForContentSizeCategory = true
		dynamicHeader.textColor = UIColor.label

		stackView.addArrangedSubview(dynamicHeader)

		for color in UIColor.Dynamic.allCases {
			let row = ColorRow()

			row.well.backgroundColor = color.value

			row.backgroundLabel.backgroundColor = color.value
			row.backgroundLabel.text = color.rawValue
			row.backgroundLabel.textColor = .white

			row.label.text = color.rawValue

			row.coloredLabel.textColor = color.value
			row.coloredLabel.text = color.rawValue

			stackView.addArrangedSubview(row)
		}

		stackView.addArrangedSubview(VerticalSpacerView.spacerWith(space: 15, backgroundColor: .systemGroupedBackground))

		let systemHeader = UILabel()
		systemHeader.numberOfLines = 0
		systemHeader.text = "Dynamic System Colors"
		systemHeader.font = UIFont.preferredFont(forTextStyle: .headline)
		systemHeader.adjustsFontForContentSizeCategory = true
		systemHeader.textColor = UIColor.label

		stackView.addArrangedSubview(systemHeader)

		for color in UIColor.System.allCases {
			let row = ColorRow()

			row.well.backgroundColor = color.value

			row.backgroundLabel.backgroundColor = color.value
			row.backgroundLabel.text = color.rawValue
			row.backgroundLabel.textColor = .white

			row.label.text = color.rawValue

			row.coloredLabel.textColor = color.value
			row.coloredLabel.text = color.rawValue

			stackView.addArrangedSubview(row)
		}

		stackView.addArrangedSubview(VerticalSpacerView.spacerWith(space: 15, backgroundColor: .systemGroupedBackground))

		let fixedHeader = UILabel()
		fixedHeader.numberOfLines = 0
		fixedHeader.text = "Fixed Colors"
		fixedHeader.font = UIFont.preferredFont(forTextStyle: .headline)
		fixedHeader.adjustsFontForContentSizeCategory = true
		fixedHeader.textColor = UIColor.label

		stackView.addArrangedSubview(fixedHeader)

		for color in UIColor.Fixed.allCases {
			let row = ColorRow()

			row.well.backgroundColor = color.value

			row.backgroundLabel.backgroundColor = color.value
			row.backgroundLabel.text = color.rawValue
			row.backgroundLabel.textColor = .white

			row.label.text = color.rawValue

			row.coloredLabel.textColor = color.value
			row.coloredLabel.text = color.rawValue

			stackView.addArrangedSubview(row)
		}
	}

}

class ColorRow: UIView {

	// MARK: - UI Elements

	let well = UIView()
	let label = UILabel()
	let coloredLabel = UILabel()
	let backgroundLabel = UILabel()

	// MARK: - Lifecycle

	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}

	required init?(coder: NSCoder) {
		fatalError()
	}

	func setup() {
		translatesAutoresizingMaskIntoConstraints = false

		label.translatesAutoresizingMaskIntoConstraints = false
		well.translatesAutoresizingMaskIntoConstraints = false
		coloredLabel.translatesAutoresizingMaskIntoConstraints = false
		backgroundLabel.translatesAutoresizingMaskIntoConstraints = false

		label.numberOfLines = 0
		label.font = .preferredFont(forTextStyle: .callout)
		label.adjustsFontForContentSizeCategory = true

		coloredLabel.numberOfLines = 0
		coloredLabel.font = .preferredFont(forTextStyle: .callout)
		coloredLabel.adjustsFontForContentSizeCategory = true

		backgroundLabel.numberOfLines = 0
		backgroundLabel.font = .preferredFont(forTextStyle: .callout)
		backgroundLabel.adjustsFontForContentSizeCategory = true

		label.setContentCompressionResistancePriority(.required, for: .vertical)
		coloredLabel.setContentCompressionResistancePriority(.required, for: .vertical)
		backgroundLabel.setContentCompressionResistancePriority(.required, for: .vertical)

		well.layer.cornerCurve = .continuous
		well.layer.cornerRadius = 20

		addSubview(well)
		addSubview(label)
		addSubview(coloredLabel)
		addSubview(backgroundLabel)

		NSLayoutConstraint.activate([
			well.widthAnchor.constraint(equalToConstant: 40),
			well.heightAnchor.constraint(equalToConstant: 40),

			well.leadingAnchor.constraint(equalTo: leadingAnchor),
			well.centerYAnchor.constraint(equalTo: centerYAnchor),

			backgroundLabel.leadingAnchor.constraint(equalTo: well.trailingAnchor, constant: 5),
			backgroundLabel.topAnchor.constraint(equalTo: topAnchor),
			backgroundLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

			label.leadingAnchor.constraint(equalTo: well.trailingAnchor, constant: 5),
			label.topAnchor.constraint(equalTo: backgroundLabel.bottomAnchor),
			label.trailingAnchor.constraint(equalTo: trailingAnchor),

			coloredLabel.leadingAnchor.constraint(equalTo: well.trailingAnchor, constant: 5),
			coloredLabel.topAnchor.constraint(equalTo: label.bottomAnchor),
			coloredLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			coloredLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
		])
	}

}
