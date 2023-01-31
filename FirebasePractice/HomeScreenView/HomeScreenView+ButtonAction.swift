import UIKit
import FirebaseAuth
import CoreLocation

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
    
    @objc func pinCurrentLocationButtonTapped() {
        if la != nil || lo != nil {
            let newPoiItem = createPin(itemName: "현재 위치", mapPoint: MTMapPoint(geoCoord: MTMapPointGeo(latitude: la, longitude: lo)), markerType: .redPin)
            
            // remove and add poiItem
            mapView.removeAllPOIItems()
            mapView.addPOIItems([newPoiItem])
            
            // move Map to current Location
            mapView.setMapCenter(MTMapPoint(geoCoord: MTMapPointGeo(latitude: la, longitude: lo)), zoomLevel: 1, animated: true)
            
        } else {
            getLocationUsagePermission()
            print("현재 위치 마크를 사용할 수 없습니다.")
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
    
    @objc func pinCurrentLocationButtonTouchDown() {
        pinCurrentLocationButton.backgroundColor = UIColor.systemIndigo
    }

    @objc func pinCurrentLocationButtonTouchUp() {
        pinCurrentLocationButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1)
    }
}
