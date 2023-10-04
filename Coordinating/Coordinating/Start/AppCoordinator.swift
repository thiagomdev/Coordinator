import UIKit

protocol AppCoordinating {
    func start()
    func goToSignIn()
    func goToHome()
}

final class AppCoordinator {
    
    private var navigation: UINavigationController
    private var rootViewController: UIViewController?
    private let sessionManager: SessionManager
    private let signInCoordinator: SignInCoordinating
    private let homeCoordinator: HomeCoordinating
    private var window: UIWindow
    
    init(
        window: UIWindow,
        navigation: UINavigationController,
        sessionManager: SessionManager = .shared,
        signInCoordinator: SignInCoordinating,
        homeCoordinator: HomeCoordinating
    ) {
        self.sessionManager = sessionManager
        self.window = window
        self.navigation = navigation
        self.homeCoordinator = homeCoordinator
        self.signInCoordinator = signInCoordinator
    }
}

extension AppCoordinator: AppCoordinating {
    func start() {
        if sessionManager.session {
            goToHome()
        } else {
            goToSignIn()
        }
    }
    
    func goToSignIn() {
        signInCoordinator.start()
    }
    
    func goToHome() {
        homeCoordinator.start()
    }
}
