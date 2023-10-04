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
        navigation: UINavigationController,
        sessionManager: SessionManager,
        signInCoordinator: SignInCoordinating,
        homeCoordinator: HomeCoordinating,
        window: UIWindow
    ) {
        self.navigation = navigation
        self.sessionManager = sessionManager
        self.signInCoordinator = signInCoordinator
        self.homeCoordinator = homeCoordinator
        self.window = window
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
