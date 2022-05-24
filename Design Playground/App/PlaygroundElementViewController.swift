import UIKit

final class PlaygroundElementViewController: UIViewController {

	// MARK: - Nested Types

	enum Element {
		case button
		case label
		case textField
		case searchTextField

		var title: String {
			switch self {
			case .button:
				return "UIButton"
			case .label:
				return "UILabel"
			case .textField:
				return "UITextField"
			case .searchTextField:
				return "UISearchTextField"
			}
		}
	}

	class ElementTraits {
		var element: Element?
		var text: String?
		var enabled: Bool?
		var font: UIFont?
		var foregroundColor: UIColor?
		var backgroundColor: UIColor?
	}

	// MARK: - Properties

	weak var playgroundViewController: PlaygroundViewController?

	fileprivate let fontPickerDelegate = FontPickerDelegate()
	fileprivate let foregroundColorPickerDelegate = ColorPickerDelegate()
	fileprivate let backgroundColorPickerDelegate = ColorPickerDelegate()

	var elements: [Element] = [.button, .label, .textField, .searchTextField]
	var elementTraits: ElementTraits? = ElementTraits()

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
		stackView.spacing = 10
		return stackView
	}()

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
		title = "Add UI Element"

		let leftBarButton = UIBarButtonItem(systemItem: .cancel, primaryAction: UIAction { [weak self] _ in
			self?.dismiss(animated: true)
		})
		let rightBarButton = UIBarButtonItem(systemItem: .add, primaryAction: UIAction { [weak self] _ in
			self?.addUIElementToPlayground()
			self?.dismiss(animated: true)
		})

		navigationItem.leftBarButtonItem = leftBarButton
		navigationItem.rightBarButtonItem = rightBarButton
	}

	func addUIElementToPlayground() {
		guard let element = elementTraits?.element else {
			return
		}

		let viewToAdd: UIView!

		switch element {
		case .button:
			let button = UIButton(type: .system)
			button.adjustsImageSizeForAccessibilityContentSizeCategory = true
			button.setTitle(elementTraits?.text, for: .normal)

			if let foregroundColor = elementTraits?.foregroundColor {
				button.setTitleColor(foregroundColor, for: .normal)
			}
			if let backgroundColor = elementTraits?.backgroundColor {
				button.backgroundColor = backgroundColor
			}
			if let font = elementTraits?.font {
				button.titleLabel?.font = font
			}
			button.isEnabled = elementTraits?.enabled ?? true

			viewToAdd = button
		case .label:
			let label = UILabel()
			label.numberOfLines = 0
			label.text = elementTraits?.text
			label.adjustsFontForContentSizeCategory = true

			if let foregroundColor = elementTraits?.foregroundColor {
				label.textColor = foregroundColor
			}
			if let backgroundColor = elementTraits?.backgroundColor {
				label.backgroundColor = backgroundColor
			}
			if let font = elementTraits?.font {
				label.font = font
			}

			label.isEnabled = elementTraits?.enabled ?? true

			viewToAdd = label
		case .textField:
			let textField = UITextField()
			textField.adjustsFontForContentSizeCategory = true
			textField.text = elementTraits?.text

			if let foregroundColor = elementTraits?.foregroundColor {
				textField.textColor = foregroundColor
			}
			if let backgroundColor = elementTraits?.backgroundColor {
				textField.backgroundColor = backgroundColor
			}
			if let font = elementTraits?.font {
				textField.font = font
			}
			textField.isEnabled = elementTraits?.enabled ?? true

			viewToAdd = textField
		case .searchTextField:
			let textField = UISearchTextField()
			textField.adjustsFontForContentSizeCategory = true
			textField.text = elementTraits?.text

			if let foregroundColor = elementTraits?.foregroundColor {
				textField.textColor = foregroundColor
			}
			if let backgroundColor = elementTraits?.backgroundColor {
				textField.backgroundColor = backgroundColor
			}
			if let font = elementTraits?.font {
				textField.font = font
			}
			textField.isEnabled = elementTraits?.enabled ?? true

			viewToAdd = textField
		}

		playgroundViewController?.stackView.addArrangedSubview(viewToAdd)
	}

}

extension PlaygroundElementViewController {

	func addUIElements() {
		let picker = UIPickerView()
		picker.delegate = self
		picker.dataSource = self
		stackView.addArrangedSubview(picker)

		elementTraits?.element = elements.first

		let enabledLabel = UILabel()
		enabledLabel.text = "Enable Control"
		enabledLabel.font = UIFont.preferredFont(forTextStyle: .headline)
		stackView.addArrangedSubview(enabledLabel)

		let enabledSwitch = UISwitch()
		enabledSwitch.addAction(UIAction { [weak self] action in
			if let `switch` = action.sender as? UISwitch {
				self?.elementTraits?.enabled = `switch`.isOn
			}
		}, for: .valueChanged)
		enabledSwitch.isOn = true
		stackView.addArrangedSubview(enabledSwitch)
		stackView.addArrangedSubview(VerticalSpacerView.spacerWith(space: 15, backgroundColor: .systemGroupedBackground))

		let textLabel = UILabel()
		textLabel.text = "Text"
		textLabel.font = UIFont.preferredFont(forTextStyle: .headline)
		stackView.addArrangedSubview(textLabel)

		let titleTextField = UITextField()
		titleTextField.addAction(UIAction { [weak self] action in
			if let textField = action.sender as? UITextField {
				self?.elementTraits?.text = textField.text
			}
		}, for: .editingChanged)
		titleTextField.placeholder = "Placeholder Text"
		stackView.addArrangedSubview(titleTextField)
		stackView.addArrangedSubview(VerticalSpacerView.spacerWith(space: 15, backgroundColor: .systemGroupedBackground))

		let fontLabel = UILabel()
		fontLabel.text = "Font"
		fontLabel.font = UIFont.preferredFont(forTextStyle: .headline)
		stackView.addArrangedSubview(fontLabel)

		let fontPicker = UIPickerView()
		fontPicker.delegate = fontPickerDelegate
		fontPicker.dataSource = fontPickerDelegate
		fontPicker.selectRow(UIFont.TextStyle.allCases.firstIndex(of: .body)!, inComponent: 0, animated: false)
		fontPickerDelegate.didSelectRow = { [weak self] in
			self?.elementTraits?.font = self?.fontPickerDelegate.font
		}
		stackView.addArrangedSubview(fontPicker)
		stackView.addArrangedSubview(VerticalSpacerView.spacerWith(space: 15, backgroundColor: .systemGroupedBackground))

		let foregroundLabel = UILabel()
		foregroundLabel.text = "Foreground Color"
		foregroundLabel.font = UIFont.preferredFont(forTextStyle: .headline)
		stackView.addArrangedSubview(foregroundLabel)

		let foregroundColorPicker = UIPickerView()
		foregroundColorPicker.delegate = foregroundColorPickerDelegate
		foregroundColorPicker.dataSource = foregroundColorPickerDelegate
		foregroundColorPickerDelegate.didSelectRow = { [weak self] in
			self?.elementTraits?.foregroundColor = self?.foregroundColorPickerDelegate.color
		}
		stackView.addArrangedSubview(foregroundColorPicker)
		stackView.addArrangedSubview(VerticalSpacerView.spacerWith(space: 15, backgroundColor: .systemGroupedBackground))

		let backgroundColorLabel = UILabel()
		backgroundColorLabel.text = "Background Color"
		backgroundColorLabel.font = UIFont.preferredFont(forTextStyle: .headline)
		stackView.addArrangedSubview(backgroundColorLabel)

		let backgroundColorPicker = UIPickerView()
		backgroundColorPicker.delegate = backgroundColorPickerDelegate
		backgroundColorPicker.dataSource = backgroundColorPickerDelegate
		backgroundColorPickerDelegate.didSelectRow = { [weak self] in
			self?.elementTraits?.backgroundColor = self?.backgroundColorPickerDelegate.color
		}
		stackView.addArrangedSubview(backgroundColorPicker)
	}

}

extension PlaygroundElementViewController: UIPickerViewDelegate, UIPickerViewDataSource {

	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}

	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return elements.count
	}

	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return elements[row].title
	}

	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		elementTraits?.element = elements[row]
	}

}

fileprivate class FontPickerDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {

	var font: UIFont? {
		didSet {
			didSelectRow?()
		}
	}

	var didSelectRow: (() -> Void)?

	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}

	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return UIFont.TextStyle.allCases.count
	}

	func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
		let label = UILabel()
		label.text = UIFont.TextStyle.allCases[row].name
		label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.allCases[row])
		return label
	}


	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.allCases[row])
	}

}

fileprivate class ColorPickerDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {

	var color: UIColor? {
		didSet {
			didSelectRow?()
		}
	}

	var didSelectRow: (() -> Void)?

	private var allColors = [UIColor.clear] + UIColor.Dynamic.allCases.map { $0.value } + UIColor.System.allCases.map { $0.value } + UIColor.Fixed.allCases.map { $0.value }

	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}

	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return allColors.count
	}

	func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
		let colorRow = ColorRow()
		colorRow.label.text = colorNameForRow(row: row)
		colorRow.backgroundLabel.text = colorNameForRow(row: row)
		colorRow.backgroundLabel.backgroundColor = allColors[row]
		colorRow.coloredLabel.text = colorNameForRow(row: row)
		colorRow.coloredLabel.textColor = allColors[row]
		colorRow.well.backgroundColor = allColors[row]
		return colorRow
	}

	func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
		60
	}

	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		if row == 0 {
			color = nil
		} else {
			color = allColors[row]
		}
	}

	func colorNameForRow(row: Int) -> String {
		let dynamicCount = UIColor.Dynamic.allCases.count
		let systemCount = UIColor.System.allCases.count
		let fixedCount = UIColor.Fixed.allCases.count

		switch row {
		case 0:
			return "Default"
		case 1...dynamicCount:
			return UIColor.Dynamic.allCases[row - 1].rawValue
		case dynamicCount...dynamicCount+systemCount:
			return UIColor.System.allCases[row - dynamicCount - 1].rawValue
		case dynamicCount+systemCount...dynamicCount+systemCount+fixedCount:
			return UIColor.Fixed.allCases[row - dynamicCount - systemCount - 1].rawValue
		default:
			return "-"
		}
	}

}
