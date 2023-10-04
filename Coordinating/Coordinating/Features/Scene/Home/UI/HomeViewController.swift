import UIKit

final class HomeViewController: UIViewController {
    fileprivate enum Layout { }
    
    var coordinator: HomeCoordinator?
    private var sessionManager: SessionManagerProtocol?
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sair", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension HomeViewController {
    @objc
    private func logoutButtonTapped() {
        sessionManager?.finishSession()
        coordinator?.logout()
    }
}

extension HomeViewController: ViewConfig {
    func buildViews() {
        view.addSubview(logoutButton)
    }
    
    func pin() {
        NSLayoutConstraint.pin([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoutButton.widthAnchor.constraint(equalToConstant: Layout.Size.width),
            logoutButton.heightAnchor.constraint(equalToConstant: Layout.Size.height)
        ])
    }
    
    func configUI() {
        view.backgroundColor = .lightGray
    }
}

private extension HomeViewController.Layout {
    enum Size {
        static let width: CGFloat = 200
        static let height: CGFloat = 50
    }
}
