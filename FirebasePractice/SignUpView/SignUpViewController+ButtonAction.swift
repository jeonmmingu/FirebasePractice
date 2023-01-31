import UIKit
import FirebaseAuth

extension SignUpViewController {
    
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
    
    @objc func conformButtonTouchDown() {
        conformButton.backgroundColor = UIColor.systemIndigo
    }

    @objc func conformButtonTouchUp() {
        conformButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
    }
    
    @objc func cancleButtonTouchDown() {
        cancleButton.backgroundColor = UIColor.systemIndigo
    }

    @objc func cancleButtonTouchUp() {
        cancleButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
    }
    
}
