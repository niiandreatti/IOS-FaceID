import UIKit

class AuthenticationTrue: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupButton()
    }
    
    private lazy var text: UILabel = {
        let text = UILabel()
        text.text = "Success"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.textAlignment = .center
        return text
    }()
    
    func setupButton() {
        view.addSubview(text)
        configureLayout()
    }
    func configureLayout(){
        
        let btn = [
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            text.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            text.widthAnchor.constraint(equalToConstant: 150),
            text.heightAnchor.constraint(equalToConstant: 50),
            ]
        NSLayoutConstraint.activate(btn)
        
    }
    
}
