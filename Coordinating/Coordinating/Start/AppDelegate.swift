import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        runApplication()
        return true
    }
}

final class SignCoordinatorVirtualProxy: SignInCoordinating {
    weak var signCoordinator: SignInCoordinating?
    
    func start() {
        signCoordinator?.start()
    }
    
    func goToHome() {
        signCoordinator?.goToHome()
    }
}

extension AppDelegate {
    private func runApplication() {
        let window = UIWindow(frame: UIScreen.main.coordinateSpace.bounds)
        self.window = window
        
        let navigation = UINavigationController()
        let signInCoordinatorVirtualProxy = SignCoordinatorVirtualProxy()
        
        let homeCoordinator = HomeCoordinator(
            window: window,
            navigation: navigation,
            signInCoordinator: signInCoordinatorVirtualProxy
        )
        
        let signInCoordinator = SignInCoordinator(
            window: window,
            homeCoordinator: homeCoordinator,
            navigationController: navigation
        )
        
        signInCoordinatorVirtualProxy.signCoordinator = signInCoordinator
        
        appCoordinator = AppCoordinator(
            navigation: navigation,
            signInCoordinator: signInCoordinator,
            homeCoordinator: homeCoordinator,
            window: window
        )
        appCoordinator?.start()
    }
}

