import UIKit

final class SignInViewController: UIViewController {
    fileprivate enum Layout { }
    
    var coordinator: SignInCoordinator?
    private var sessionManager: SessionManagerProtocol?
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Override(s).
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}
extension SignInViewController {
    @objc
    private func loginButtonTapped() {
        sessionManager?.startSession()
        coordinator?.goToHome()
    }
}

extension SignInViewController: ViewConfig {
    func buildViews() {
        view.addSubview(loginButton)
    }
    
    func pin() {
        NSLayoutConstraint.pin([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: Layout.Size.width),
            loginButton.heightAnchor.constraint(equalToConstant: Layout.Size.height)
        ])
    }
    
    func configUI() {
        view.backgroundColor = .cyan
    }
}

private extension SignInViewController.Layout {
    enum Size {
        static let width: CGFloat = 200
        static let height: CGFloat = 50
    }
}
