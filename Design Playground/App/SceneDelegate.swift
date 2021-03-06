import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }

		let tabBarController = UITabBarController()

		let uiElementsViewController = UIElementsViewController(nibName: nil, bundle: nil)
		if #available(iOS 15, *) {
			uiElementsViewController.tabBarItem = UITabBarItem(title: "UI", image: UIImage(systemName: "slider.horizontal.below.square.filled.and.square"), selectedImage: UIImage(systemName: "slider.horizontal.below.square.filled.and.square"))
		} else {
			uiElementsViewController.tabBarItem = UITabBarItem(title: "UI", image: UIImage(systemName: "slider.horizontal.below.rectangle"), selectedImage: UIImage(systemName: "slider.horizontal.below.rectangle"))
		}

		let textViewController = TextViewController(nibName: nil, bundle: nil)
		textViewController.tabBarItem = UITabBarItem(title: "Text", image: UIImage(systemName: "doc.plaintext.fill"), selectedImage: UIImage(systemName: "doc.plaintext.fill"))

		let colorsViewController = ColorsViewController(nibName: nil, bundle: nil)
		colorsViewController.tabBarItem = UITabBarItem(title: "Colors", image: UIImage(systemName: "paintpalette.fill"), selectedImage: UIImage(systemName: "paintpalette.fill"))

		let playgroundViewController = PlaygroundViewController(nibName: nil, bundle: nil)
		if #available(iOS 15, *) {
			playgroundViewController.tabBarItem = UITabBarItem(title: "Playground", image: UIImage(systemName: "rectangle.and.hand.point.up.left.fill"), selectedImage: UIImage(systemName: "rectangle.and.hand.point.up.left.fill"))
		} else {
			playgroundViewController.tabBarItem = UITabBarItem(title: "Playground", image: UIImage(systemName: "hand.tap"), selectedImage: UIImage(systemName: "hand.tap"))
		}

		tabBarController.viewControllers = [
			UINavigationController(rootViewController: uiElementsViewController),
			UINavigationController(rootViewController: textViewController),
			UINavigationController(rootViewController: colorsViewController),
			UINavigationController(rootViewController: playgroundViewController),
		]

		let window = UIWindow(windowScene: windowScene)
		window.rootViewController = tabBarController
		window.makeKeyAndVisible()
		self.window = window
	}

}

