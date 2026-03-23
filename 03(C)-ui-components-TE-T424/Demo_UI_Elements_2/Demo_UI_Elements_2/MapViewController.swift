//
//  MapViewCOntroller.swift
//  Demo_UI_Elements_2
//
//  Created by Bhumik Poshiya on 26/03/26.
//
import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var myMapView: MKMapView!
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationervices()
    }
    
    
    func checkLocationervices() {
        if CLLocationManager.locationServicesEnabled() {
            self.locationPermission()
        }
    }
    
    func locationPermission() {
        switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted, .denied:
                break
            case .authorizedAlways, .authorizedWhenInUse:
                myMapView.showsUserLocation = true
            default:
                break
        }
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
}


