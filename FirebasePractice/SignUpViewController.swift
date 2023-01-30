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
        setupView()
        if Auth.auth().currentUser != nil {
            let vc = HomeScreenViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    func setupView() {
        view.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
        
        emailTextField.borderStyle = .roundedRect
        emailTextField.placeholder = "Email"
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        conformButton.layer.cornerRadius = 15.0
        conformButton.setTitle("Conform", for: .normal)
        conformButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        conformButton.setTitleColor(.white, for: .normal)
        conformButton.translatesAutoresizingMaskIntoConstraints = false
        conformButton.addTarget(self, action: #selector(conformAction), for: .touchUpInside)
        
        cancleButton.layer.cornerRadius = 15.0
        cancleButton.setTitle("Cancle", for: .normal)
        cancleButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        cancleButton.setTitleColor(.white, for: .normal)
        cancleButton.translatesAutoresizingMaskIntoConstraints = false
        cancleButton.addTarget(self, action: #selector(CancleAction), for: .touchUpInside)
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(conformButton)
        view.addSubview(cancleButton)
        
        
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
    
    @objc func conformAction(){
        // Get email and password from text fields
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        // Create new user in Firebase
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                // Show error message
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            // User has been successfully created
            let alert = UIAlertController(title: "Success", message: "User has been created successfully", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
                // Navigate to home screen
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func CancleAction() {
        navigationController?.popViewController(animated: true)
    }
    
}
