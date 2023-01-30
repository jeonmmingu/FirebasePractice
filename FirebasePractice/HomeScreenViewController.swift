import UIKit
import FirebaseAuth

class HomeScreenViewController: UIViewController {
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter text here"
        tf.textAlignment = .center
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.backgroundColor = CGColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        button.layer.cornerRadius = 15.0
        return button
    }()
    
    let deleteAccountButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Delete Account", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.backgroundColor = CGColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        button.layer.cornerRadius = 15.0
        return button
    }()
    
    let tabBar = UITabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupTextField()
        setupLogoutButton()
        setupDeleteAccountButton()
        setupLayout()
    }
    
    func setupTabBar() {
        let firstTab = UITabBarItem(title: "First", image: nil, tag: 0)
        let secondTab = UITabBarItem(title: "Second", image: nil, tag: 1)
        let thirdTab = UITabBarItem(title: "Third", image: nil, tag: 2)
        let fourthTab = UITabBarItem(title: "Fourth", image: nil, tag: 3)
        
        tabBar.items = [firstTab, secondTab, thirdTab, fourthTab]
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tabBar)
    }
    
    func setupTextField() {
        view.addSubview(textField)
    }
    
    func setupLogoutButton() {
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        view.addSubview(logoutButton)
    }
    
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
    
    func setupDeleteAccountButton() {
        deleteAccountButton.addTarget(self, action: #selector(deleteAccountButtonTapped), for: .touchUpInside)
        view.addSubview(deleteAccountButton)
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
    
    func setupLayout() {
        view.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalToConstant: 200),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            logoutButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 40),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.widthAnchor.constraint(equalToConstant: 130),
            logoutButton.heightAnchor.constraint(equalToConstant: 33),
            
            deleteAccountButton.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 20),
            deleteAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteAccountButton.widthAnchor.constraint(equalToConstant: 130),
            deleteAccountButton.heightAnchor.constraint(equalToConstant: 33),
            
            tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
