import UIKit
import FirebaseAuth

extension HomeScreenViewController {
    
    @objc func logoutButtonTapped() {
        do {
            try Auth.auth().signOut()
            if self.navigationController?.viewControllers.count == 1 {
                let vc = LoginViewController()
                let navigationController = UINavigationController()
                navigationController.pushViewController(vc, animated: true)
            } else {
                self.navigationController?.popToRootViewController(animated: false)
            }
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    @objc func deleteAccountButtonTapped() {
        let user = Auth.auth().currentUser
        user?.delete { error in
            if let error = error {
                // An error occurred while deleting the user account
                print("Error deleting user account: \(error)")
            } else {
                // Account deleted successfully
                print("User account deleted successfully")
                if self.navigationController?.viewControllers.count == 1 {
                    let vc = LoginViewController()
                    let navigationController = UINavigationController()
                    navigationController.pushViewController(vc, animated: true)
                    
                } else {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    @objc func logoutButtonTouchDown() {
        logoutButton.backgroundColor = UIColor.systemIndigo
    }

    @objc func logoutButtonTouchUp() {
        logoutButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
    }
    
    @objc func deleteAccountButtonTouchDown() {
        deleteAccountButton.backgroundColor = UIColor.systemIndigo
    }

    @objc func deleteAccountButtonTouchUp() {
        deleteAccountButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
    }
    
}
