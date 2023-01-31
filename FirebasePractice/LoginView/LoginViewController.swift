import UIKit
import FirebaseCore
import FirebaseAuth

class LoginViewController: UIViewController {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    let signUpButton = UIButton()
    let GoogleSignUpButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupSignUpButton()
        setupGoogleSignUpButton()
        setupLayout()
        
        if Auth.auth().currentUser != nil {
            let vc = HomeScreenViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    func setupEmailTextField() {
        emailTextField.borderStyle = .roundedRect
        emailTextField.placeholder = "Email"
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
    }
    
    func setupPasswordTextField() {
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
    }
    
    func setupLoginButton() {
        loginButton.layer.cornerRadius = 15.0
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTouchDown), for: .touchDown)
        loginButton.addTarget(self, action: #selector(loginButtonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        view.addSubview(loginButton)
    }
    
    func setupGoogleSignUpButton() {
        GoogleSignUpButton.layer.cornerRadius = 15.0
        GoogleSignUpButton.setTitle("Login", for: .normal)
        GoogleSignUpButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        GoogleSignUpButton.setTitleColor(.white, for: .normal)
        GoogleSignUpButton.translatesAutoresizingMaskIntoConstraints = false
        GoogleSignUpButton.addTarget(self, action: #selector(googleSignUpButtonTapped), for: .touchUpInside)
        GoogleSignUpButton.addTarget(self, action: #selector(googleSignUpButtonTouchDown), for: .touchDown)
        GoogleSignUpButton.addTarget(self, action: #selector(googleSignUpButtonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        view.addSubview(GoogleSignUpButton)
    }
    
    func setupSignUpButton() {
        signUpButton.layer.cornerRadius = 15.0
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTouchDown), for: .touchDown)
        signUpButton.addTarget(self, action: #selector(signUpButtonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        view.addSubview(signUpButton)
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
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 130),
            loginButton.heightAnchor.constraint(equalToConstant: 33),
            
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: 130),
            signUpButton.heightAnchor.constraint(equalToConstant: 33),
            
            GoogleSignUpButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20),
            GoogleSignUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            GoogleSignUpButton.widthAnchor.constraint(equalToConstant: 130),
            GoogleSignUpButton.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
}
