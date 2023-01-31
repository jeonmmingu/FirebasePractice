import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn


extension LoginViewController {
    
    // Button Tapped Func
    
    @objc func loginButtonTapped() {
        loginButton.isUserInteractionEnabled = false
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            // User has been successfully login
            if user != nil{
                let alert = UIAlertController(title: "Login Success", message: "Successfully login", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in
                    self.loginButton.isUserInteractionEnabled = true
                    let vc = HomeScreenViewController()
                    self.navigationController?.pushViewController(vc, animated: true)})
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
            else{
                // Show error message
                let alert = UIAlertController(title: "Login Fail", message: error?.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in
                    self.loginButton.isUserInteractionEnabled = true
                })
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
    }
    
    @objc func signUpButtonTapped() {
        signUpButton.isUserInteractionEnabled = false
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        signUpButton.isUserInteractionEnabled = true
    }
    
    @objc func googleSignUpButtonTapped() {
        GoogleSignUpButton.isUserInteractionEnabled = false
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let signInConfig = GIDConfiguration.init(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else {
                // 유저가 cancle을 누르는 경우도 error 처리가 되어 있기 때문에 여기에 코드를 추가
                self.GoogleSignUpButton.isUserInteractionEnabled = true
                return
            }
            
            guard let authentication = user?.authentication else {
                self.GoogleSignUpButton.isUserInteractionEnabled = true
                return
            }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken!, accessToken: authentication.accessToken)
            // access token 부여 받음
            
            // Firebase 인증정보 등록
            Auth.auth().signIn(with: credential) {_,_ in
                // token을 넘겨주면, 성공했는지 안했는지에 대한 result값과 error값을 넘겨줌
                let alert = UIAlertController(title: "Login Success", message: "Successfully login", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in
                    self.GoogleSignUpButton.isUserInteractionEnabled = true
                    let vc = HomeScreenViewController()
                    self.navigationController?.pushViewController(vc, animated: true)})
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @objc func appleSignUpButtonTapped() {
        AppleSignUpButton.isUserInteractionEnabled = false
        startSignInWithAppleFlow()
    }
    
    @objc func guestSignUpButtonTapped() {
        GuestSignUpButton.isUserInteractionEnabled = false
        Auth.auth().signInAnonymously { (authResult, error) in
            if let error = error {
                let alert = UIAlertController(title: "Login Fail", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in
                    self.GuestSignUpButton.isUserInteractionEnabled = true
                })
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                return
            } else {
                let alert = UIAlertController(title: "Login Success", message: "Successfully login", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in
                    self.GuestSignUpButton.isUserInteractionEnabled = true
                    let vc = HomeScreenViewController()
                    self.navigationController?.pushViewController(vc, animated: true)})
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // Hover style Set Func
    
    @objc func loginButtonTouchDown() {
        loginButton.backgroundColor = UIColor.systemIndigo
    }
    
    @objc func loginButtonTouchUp() {
        loginButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
    }
    
    @objc func signUpButtonTouchDown() {
        signUpButton.backgroundColor = UIColor.systemIndigo
    }
    
    @objc func signUpButtonTouchUp() {
        signUpButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
    }
    
    @objc func googleSignUpButtonTouchDown() {
        GoogleSignUpButton.colorScheme = .dark
    }
    
    @objc func googleSignUpButtonTouchUp() {
        GoogleSignUpButton.colorScheme = .light
    }
    
    @objc func appleSignUpButtonTouchDown() {
        AppleSignUpButton.backgroundColor = UIColor.systemIndigo
    }
    
    @objc func appleSignUpButtonTouchUp() {
        AppleSignUpButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
    }
    
    @objc func guestSignUpButtonTouchDown() {
        GuestSignUpButton.backgroundColor = UIColor.systemIndigo
    }
    
    @objc func guestSignUpButtonTouchUp() {
        GuestSignUpButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
    }
    
}
