import UIKit
import FirebaseAuth

class HomeScreenViewController: UIViewController {
    
    let textField = UITextField()
    let logoutButton = UIButton()
    let deleteAccountButton = UIButton()
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter text here"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
    }
    
    func setupLogoutButton() {
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.layer.backgroundColor = CGColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        logoutButton.layer.cornerRadius = 15.0
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        logoutButton.addTarget(self, action: #selector(logoutButtonTouchDown), for: .touchDown)
        logoutButton.addTarget(self, action: #selector(logoutButtonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        view.addSubview(logoutButton)
    }
    
    
    func setupDeleteAccountButton() {
        deleteAccountButton.translatesAutoresizingMaskIntoConstraints = false
        deleteAccountButton.setTitle("Delete Account", for: .normal)
        deleteAccountButton.setTitleColor(.white, for: .normal)
        deleteAccountButton.layer.backgroundColor = CGColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        deleteAccountButton.layer.cornerRadius = 15.0
        deleteAccountButton.addTarget(self, action: #selector(deleteAccountButtonTapped), for: .touchUpInside)
        deleteAccountButton.addTarget(self, action: #selector(deleteAccountButtonTouchDown), for: .touchDown)
        deleteAccountButton.addTarget(self, action: #selector(deleteAccountButtonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        view.addSubview(deleteAccountButton)
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
