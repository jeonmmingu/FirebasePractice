import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let conformButton = UIButton()
    let cancleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 로그인된 상태인지 확인하는 코드
        setupEmailTextField()
        setupPasswordTextField()
        setupConformButton()
        setupCancleButton()
        setupLayout()
        if Auth.auth().currentUser != nil {
            let vc = HomeScreenViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func setupEmailTextField(){
        emailTextField.borderStyle = .roundedRect
        emailTextField.placeholder = "Email"
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
    }
    
    func setupPasswordTextField(){
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
    }
    
    func setupConformButton(){
        conformButton.layer.cornerRadius = 15.0
        conformButton.setTitle("Conform", for: .normal)
        conformButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        conformButton.setTitleColor(.white, for: .normal)
        conformButton.translatesAutoresizingMaskIntoConstraints = false
        conformButton.addTarget(self, action: #selector(conformAction), for: .touchUpInside)
        conformButton.addTarget(self, action: #selector(conformButtonTouchDown), for: .touchDown)
        conformButton.addTarget(self, action: #selector(conformButtonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        view.addSubview(conformButton)
    }
    
    func setupCancleButton(){
        cancleButton.layer.cornerRadius = 15.0
        cancleButton.setTitle("Cancle", for: .normal)
        cancleButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        cancleButton.setTitleColor(.white, for: .normal)
        cancleButton.translatesAutoresizingMaskIntoConstraints = false
        cancleButton.addTarget(self, action: #selector(CancleAction), for: .touchUpInside)
        cancleButton.addTarget(self, action: #selector(cancleButtonTouchDown), for: .touchDown)
        cancleButton.addTarget(self, action: #selector(cancleButtonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        view.addSubview(cancleButton)
    }
    
    func setupLayout() {
        view.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 280),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            conformButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            conformButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            conformButton.widthAnchor.constraint(equalToConstant: 130),
            conformButton.heightAnchor.constraint(equalToConstant: 33),
            
            cancleButton.topAnchor.constraint(equalTo: conformButton.bottomAnchor, constant: 20),
            cancleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cancleButton.widthAnchor.constraint(equalToConstant: 130),
            cancleButton.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
}
