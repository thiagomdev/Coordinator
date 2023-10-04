import UIKit

protocol SignInCoordinating: AnyObject {
    func start()
    func goToHome()
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
        
        UIView.transition(
            with: window,
            duration: 1.0,
            options: .curveEaseInOut,
            animations: { [weak self] in
                self?.window.rootViewController = signIn
                self?.window.makeKeyAndVisible()
        })
    }
    
    func goToHome() {
        homeCoordinator.start()
    }
}
