import UIKit
import FirebaseAuth
import CoreLocation

class HomeScreenViewController: UIViewController {
    
    let pinCurrentLocationButton = UIButton()
    let logoutButton = UIButton()
    let deleteAccountButton = UIButton()
    let tabBar = UITabBar()
    var mapView: MTMapView!
    var locationManager: CLLocationManager!
    var la: Double! // 현재 위치 경도
    var lo: Double! // 현재 위치 위도
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupTextField()
        setupLogoutButton()
        setupDeleteAccountButton()
        setupLocationManager()
        setupMapView()
        setupLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       view.endEditing(true)
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
        pinCurrentLocationButton.translatesAutoresizingMaskIntoConstraints = false
        pinCurrentLocationButton.setTitle("Pin Current Location", for: .normal)
        pinCurrentLocationButton.setTitleColor(.white, for: .normal)
        pinCurrentLocationButton.layer.backgroundColor = CGColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
        pinCurrentLocationButton.layer.cornerRadius = 15.0
        pinCurrentLocationButton.addTarget(self, action: #selector(pinCurrentLocationButtonTapped), for: .touchUpInside)
        pinCurrentLocationButton.addTarget(self, action: #selector(pinCurrentLocationButtonTouchDown), for: .touchDown)
        pinCurrentLocationButton.addTarget(self, action: #selector(pinCurrentLocationButtonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        view.addSubview(pinCurrentLocationButton)
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
            tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: 80),
            
            deleteAccountButton.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: -30),
            deleteAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteAccountButton.widthAnchor.constraint(equalToConstant: 130),
            deleteAccountButton.heightAnchor.constraint(equalToConstant: 33),
            
            logoutButton.bottomAnchor.constraint(equalTo: deleteAccountButton.topAnchor, constant: -30),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.widthAnchor.constraint(equalToConstant: 130),
            logoutButton.heightAnchor.constraint(equalToConstant: 33),
            
            pinCurrentLocationButton.bottomAnchor.constraint(equalTo: logoutButton.topAnchor, constant: -30),
            pinCurrentLocationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pinCurrentLocationButton.widthAnchor.constraint(equalToConstant: 200),
            pinCurrentLocationButton.heightAnchor.constraint(equalToConstant: 40),
            
            mapView.bottomAnchor.constraint(equalTo: pinCurrentLocationButton.topAnchor, constant: -30),
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
}
