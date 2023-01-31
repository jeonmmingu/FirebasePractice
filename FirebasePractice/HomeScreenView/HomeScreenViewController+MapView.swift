import UIKit

extension HomeScreenViewController: MTMapViewDelegate {
    func setupMapView() {
        mapView = MTMapView()
        mapView.delegate = self
        mapView.baseMapType = .standard
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.layer.cornerRadius = 20.0
        self.view.addSubview(mapView)
    }
}
