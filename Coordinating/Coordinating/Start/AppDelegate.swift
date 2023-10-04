import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private var appCoordinator: AppCoordinator?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        return runApplication()
    }
}

extension AppDelegate {
    private func runApplication() -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
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
            window: window,
            navigation: navigation,
            signInCoordinator: signInCoordinator,
            homeCoordinator: homeCoordinator
        )
        appCoordinator?.start()
        return true
    }
}

