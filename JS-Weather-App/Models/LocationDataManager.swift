//
//  LocationDataManager.swift
//  JS-Weather-App
//
//  Created by John Erick Santos on 9/4/2023.
//

import CoreLocation
import Foundation

class LocationDataManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    var weatherManager = WeatherManager()

    @Published var lat: CLLocationDegrees?
    @Published var lon: CLLocationDegrees?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            lat = location.coordinate.latitude
            lon = location.coordinate.longitude
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationManager.requestWhenInUseAuthorization()
    }
}
