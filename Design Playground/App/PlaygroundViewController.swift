import UIKit

final class PlaygroundViewController: UIViewController {

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
		stackView.distribution = .fill
		stackView.spacing = 10
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
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Playground"

		let rightItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tappedAdd))
		navigationItem.rightBarButtonItem = rightItem
	}

	// MARK: - Actions

	@objc func tappedAdd() {
		let elementConfigurationViewController = PlaygroundElementViewController(nibName: nil, bundle: nil)
		elementConfigurationViewController.playgroundViewController = self
		let navigationController = UINavigationController(rootViewController: elementConfigurationViewController)
		present(navigationController, animated: true, completion: nil)
	}

}
