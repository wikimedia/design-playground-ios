import UIKit

extension UIFont.TextStyle: CaseIterable {

	public static var allCases: [UIFont.TextStyle] {
		[
			.largeTitle,
			.title1,
			.title2,
			.title3,
			.headline,
			.subheadline,
			.body,
			.callout,
			.footnote,
			.caption1,
			.caption2
		]
	}

	public var name: String {
		switch self {
		case .largeTitle:
			return "Large Title"
		case .title1:
			return "Title 1"
		case .title2:
			return "Title 2"
		case .title3:
			return "Title 3"
		case .headline:
			return "Headline"
		case .subheadline:
			return "Subheadline"
		case .body:
			return "Body"
		case .callout:
			return "Callout"
		case .footnote:
			return "Footnote"
		case .caption1:
			return "Caption 1"
		case .caption2:
			return "Caption 2"
		default:
			return "None"
		}
	}

}
