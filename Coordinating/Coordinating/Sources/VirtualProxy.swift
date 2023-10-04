final class SignCoordinatorVirtualProxy: SignInCoordinating {
    weak var signCoordinator: SignInCoordinating?
    
    func start() {
        signCoordinator?.start()
    }
    
    func goToHome() {
        signCoordinator?.goToHome()
    }
}
