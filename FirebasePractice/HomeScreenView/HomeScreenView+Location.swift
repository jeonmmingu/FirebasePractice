import UIKit
import CoreLocation

extension HomeScreenViewController: CLLocationManagerDelegate {
    
    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        getLocationUsagePermission()
        locationManager.startUpdatingLocation()
    }
    
    func getLocationUsagePermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func translateLocationInKorean(){
        if la != nil || lo != nil {
            let LocationNow = CLLocation(latitude: la!, longitude: lo!)
            print(LocationNow)
            let geocoder = CLGeocoder()
            let locale = Locale(identifier: "Ko-kr")
            geocoder.reverseGeocodeLocation(LocationNow, preferredLocale: locale, completionHandler: {(placemarks, error) in
                if let address: [CLPlacemark] = placemarks {
                    if let country: String = address.last?.country {print(country)}
                    if let administrativeArea: String = address.last?.administrativeArea {print(administrativeArea)}
                    if let subLocality: String = address.last?.subLocality {print(subLocality)}
                    if let name:String = address.last?.name {print(name)}
                }
            })
        } else {
            print("failed ㅠㅠ")
        }
    }
    
    func createPin(itemName:String, mapPoint:MTMapPoint, markerType: MTMapPOIItemMarkerType) -> MTMapPOIItem {
        let poiItem = MTMapPOIItem()
        poiItem.itemName = "\(itemName)"
        poiItem.mapPoint = mapPoint
        poiItem.markerType = markerType
        mapView.addPOIItems([poiItem])
        return poiItem
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case.authorizedAlways,.authorizedWhenInUse:
            print("GPS 권한 설정됨")
        case.restricted,.notDetermined:
            print("GPS 권한 설정되지 않음")
            getLocationUsagePermission()
        case.denied:
            print("GPS 권한 요청 거부 됨")
            getLocationUsagePermission()
        default:
            print("GPS: Deafault")
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 배열이 0부터 시작하기 때문에 시작 위치를 찾기 위해 1을 빼준다.
        let location: CLLocation = locations[locations.count - 1]
        lo = location.coordinate.longitude
        la = location.coordinate.latitude
        translateLocationInKorean()
    }
}
