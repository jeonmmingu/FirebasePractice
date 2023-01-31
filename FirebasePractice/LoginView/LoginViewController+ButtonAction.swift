import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

extension LoginViewController {
    
    // Button Tapped Func
    
    @objc func loginButtonTapped() {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            // User has been successfully login
            if user != nil{
                let alert = UIAlertController(title: "Login Success", message: "Successfully login", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in
                    let vc = HomeScreenViewController()
                    self.navigationController?.pushViewController(vc, animated: true)})
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
            else{
                // Show error message
                let alert = UIAlertController(title: "Login Fail", message: error?.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
    }
    
    @objc func signUpButtonTapped() {
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func googleSignUpButtonTapped() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let signInConfig = GIDConfiguration.init(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            
            guard let authentication = user?.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken!, accessToken: authentication.accessToken)
            // access token 부여 받음
            
            // Firebase 인증정보 등록
            Auth.auth().signIn(with: credential) {_,_ in
                // token을 넘겨주면, 성공했는지 안했는지에 대한 result값과 error값을 넘겨줌
                print("Success!")
            }
        }
        // 사용자 등록 후 HomeScreenView 로 이동
        let alert = UIAlertController(title: "Login Success", message: "Successfully login", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in
            let vc = HomeScreenViewController()
            self.navigationController?.pushViewController(vc, animated: true)})
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
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
        signUpButton.backgroundColor = UIColor.systemIndigo
    }
    
    @objc func googleSignUpButtonTouchUp() {
        signUpButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
    }
    
}
