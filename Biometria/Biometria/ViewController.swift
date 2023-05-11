import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    let btnCliqueAqui: UIButton = {
        let button = UIButton()
        button.setTitle("Clique aqui", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButton()
    }
    
    func setupButton() {
        view.addSubview(btnCliqueAqui)
        configureLayout()
    }
    
    func configureLayout(){
        let btn = [
            btnCliqueAqui.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnCliqueAqui.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btnCliqueAqui.widthAnchor.constraint(equalToConstant: 150),
            btnCliqueAqui.heightAnchor.constraint(equalToConstant: 50),
        ]
        NSLayoutConstraint.activate(btn)
    }
    
    @objc func didTapButton() {
        let context = LAContext()
        var erro: NSError?
        let reason = "Por favor, autentique-se para acessar sua conta"
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &erro) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, error) in
                if success {
                    DispatchQueue.main.async {
                        let authTrueVC = AuthenticationTrue()
                        self.navigationController?.pushViewController(authTrueVC, animated: true)
                    }
                } else {
                    DispatchQueue.main.async {
                        let authFalseVC = AuthenticationFalse()
                        self.navigationController?.pushViewController(authFalseVC, animated: true)
                    }
                }
            }
        } else {
            print("erro de autenticação")
        }
    }
}

