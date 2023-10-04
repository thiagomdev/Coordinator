import UIKit

final class SignInViewController: UIViewController {

    var coordinator: SignInCoordinator?
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Override(s).
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupLoginButton()
    }
    
    // MARK: - Method(s).
    private func setupLoginButton() {
        view.addSubview(loginButton)
        
        NSLayoutConstraint.pin([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc
    private func loginButtonTapped() {
        SessionManager.shared.startSession()
        coordinator?.goToHome()
    }
}
