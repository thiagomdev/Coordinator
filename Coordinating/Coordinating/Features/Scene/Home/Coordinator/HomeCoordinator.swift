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
    
    init(
        window: UIWindow,
        navigation: UINavigationController,
        signInCoordinator: SignInCoordinating
    ) {
        self.window = window
        self.navigation = navigation
        self.signInCoordinator = signInCoordinator
    }
}

extension HomeCoordinator: HomeCoordinating {
    func start() {
        let home = HomeViewController()
        let navigation = UINavigationController(rootViewController: home)
        
        home.coordinator = self
        
        UIView.transition(
            with: window,
            duration: 1.0,
            options: .curveEaseInOut,
            animations: { [weak self] in
                self?.window.rootViewController = navigation
                self?.window.makeKeyAndVisible()
        })
    }
    
    func logout() {
        signInCoordinator?.start()
    }
}
