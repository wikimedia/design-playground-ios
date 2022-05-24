import UIKit

extension UIColor {

	enum Fixed: String, CaseIterable {
		case black
		case blue
		case brown
		case cyan
		case darkGray
		case gray
		case green
		case lightGray
		case magenta
		case orange
		case purple
		case red
		case white
		case yellow

		var value: UIColor {
			switch self {
			case .black:
				return UIColor.black
			case .blue:
				return UIColor.blue
			case .brown:
				return UIColor.brown
			case .cyan:
				return UIColor.cyan
			case .darkGray:
				return UIColor.darkGray
			case .gray:
				return UIColor.gray
			case .green:
				return UIColor.green
			case .lightGray:
				return UIColor.lightGray
			case .magenta:
				return UIColor.magenta
			case .orange:
				return UIColor.orange
			case .purple:
				return UIColor.purple
			case .red:
				return UIColor.red
			case .white:
				return UIColor.white
			case .yellow:
				return UIColor.yellow
			}
		}
	}

	enum Dynamic: String, CaseIterable {
		case systemBlue
		case systemBrown
		case systemGreen
		case systemIndigo
		case systemOrange
		case systemPink
		case systemPurple
		case systemRed
		case systemTeal
		case systemYellow
		case systemGray
		case systemGray2
		case systemGray3
		case systemGray4
		case systemGray5
		case systemGray6

		var value: UIColor {
			switch self {
			case .systemBlue:
				return UIColor.systemBlue
			case .systemBrown:
				return UIColor.systemBrown
			case .systemGreen:
				return UIColor.systemGreen
			case .systemIndigo:
				return UIColor.systemIndigo
			case .systemOrange:
				return UIColor.systemOrange
			case .systemPink:
				return UIColor.systemPink
			case .systemPurple:
				return UIColor.systemPurple
			case .systemRed:
				return UIColor.systemRed
			case .systemTeal:
				return UIColor.systemTeal
			case .systemYellow:
				return UIColor.systemYellow
			case .systemGray:
				return UIColor.systemGray
			case .systemGray2:
				return UIColor.systemGray2
			case .systemGray3:
				return UIColor.systemGray3
			case .systemGray4:
				return UIColor.systemGray4
			case .systemGray5:
				return UIColor.systemGray5
			case .systemGray6:
				return UIColor.systemGray6
			}
		}
	}

	enum System: String, CaseIterable {
		case label
		case secondaryLabel
		case tertiaryLabel
		case quaternaryLabel
		case placeholderText
		case separator
		case opaqueSeparator
		case link
		case systemFill
		case secondarySystemFill
		case tertiarySystemFill
		case quarternarySystemFill
		case systemBackground
		case secondarySystemBackground
		case tertiarySystemBackground
		case systemGroupedBackground
		case secondarySystemGroupedBackground
		case tertiarySystemGroupedBackground
		case lightText
		case darkText

		var value: UIColor {
			switch self {
			case .label:
				return UIColor.label
			case .secondaryLabel:
				return UIColor.secondaryLabel
			case .tertiaryLabel:
				return UIColor.tertiaryLabel
			case .quaternaryLabel:
				return UIColor.quaternaryLabel
			case .placeholderText:
				return UIColor.placeholderText
			case .separator:
				return UIColor.separator
			case .opaqueSeparator:
				return UIColor.opaqueSeparator
			case .link:
				return UIColor.link
			case .systemFill:
				return UIColor.systemFill
			case .secondarySystemFill:
				return UIColor.secondarySystemFill
			case .tertiarySystemFill:
				return UIColor.tertiarySystemFill
			case .quarternarySystemFill:
				return UIColor.quaternarySystemFill
			case .systemBackground:
				return UIColor.systemBackground
			case .secondarySystemBackground:
				return UIColor.secondarySystemBackground
			case .tertiarySystemBackground:
				return UIColor.tertiarySystemBackground
			case .systemGroupedBackground:
				return UIColor.systemGroupedBackground
			case .secondarySystemGroupedBackground:
				return UIColor.secondarySystemGroupedBackground
			case .tertiarySystemGroupedBackground:
				return UIColor.tertiarySystemGroupedBackground
			case .lightText:
				return UIColor.lightText
			case .darkText:
				return UIColor.darkText
			}
		}
	}

}
