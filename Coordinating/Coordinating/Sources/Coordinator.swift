import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    var rootViewController: UIViewController? { get set }
    
    func start()
}
