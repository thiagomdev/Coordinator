import UIKit

protocol HomeCoordinating {
    func start()
    func logout()
}

final class HomeCoordinator {
    private let window: UIWindow
    private var navigation: UINavigationController
    private var rootViewController: UIViewController?
    weak var signInCoordinator: SignInCoordinating?
    
    init(window: UIWindow, navigation: UINavigationController) {
        self.window = window
        self.navigation = navigation
    }
}

extension HomeCoordinator: HomeCoordinating {
    func start() {
        let home = HomeViewController()
        let navigation = UINavigationController(rootViewController: home)
        home.coordinator = self
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
    
    func logout() {
        signInCoordinator?.start()
    }
}
