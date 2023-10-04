import UIKit

protocol SignInCoordinating: AnyObject {
    func start()
    func gotToHome()
}

final class SignInCoordinator {
    
    private let window: UIWindow
    private let homeCoordinator: HomeCoordinating
    private var navigationController: UINavigationController
    private var rootViewController: UIViewController?
    
    init(
        window: UIWindow,
        homeCoordinator: HomeCoordinating,
        navigationController: UINavigationController
    ) {
        self.window = window
        self.homeCoordinator = homeCoordinator
        self.navigationController = navigationController
    }
}

extension SignInCoordinator: SignInCoordinating {
    func start() {
        let signIn = SignInViewController()
        signIn.coordinator = self
        window.rootViewController = UINavigationController(rootViewController: signIn)
        window.makeKeyAndVisible()
    }
    
    func gotToHome() {
        homeCoordinator.start()
    }
}
