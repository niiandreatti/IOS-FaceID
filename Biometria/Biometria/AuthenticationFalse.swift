import UIKit

class AuthenticationFalse: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupButton()
        scheduleAlert() // Agende a exibição do alerta
    }
    
    private lazy var text: UILabel = {
        let text = UILabel()
        text.text = "Error"
        text.textColor = .black
        let customFont = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        text.font = customFont
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    func setupButton() {
        view.addSubview(text)
        configureLayout()
    }
    
    func configureLayout(){
        let btn = [
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),           text.centerYAnchor.constraint(equalTo: view.centerYAnchor),        ]
        NSLayoutConstraint.activate(btn)
    }
    
    func scheduleAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { // Agende a exibição do alerta com atraso de 5 segundos
            let alertController = UIAlertController(title: "Erro de autenticação", message: "Biometria não reconhecida", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

