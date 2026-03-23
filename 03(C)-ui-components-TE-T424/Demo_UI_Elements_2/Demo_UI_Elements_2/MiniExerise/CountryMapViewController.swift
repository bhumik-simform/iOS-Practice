//  CountryChoose.swift
//  Demo_UI_Elements_2
//
//  Created by Bhumik Poshiya on 26/03/26.
//

import UIKit
import MapKit

class CountryMapViewController: UIViewController {
    @IBOutlet weak var countryMapView: MKMapView!

    
    override func viewWillAppear(_ animated: Bool) {
        loadMap(of: AppSate.sahred.selectedCountry)
    }
    
    func loadMap(of countryName: String) {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(countryName) { (placemarks, error) in
            if let error = error {
                print("Failed to find: \(countryName)")
                print("THe Error is: \(error.localizedDescription)")
                return
            }
            
            guard let location = placemarks?.first?.location else {
                print("Corrdinates is not foun for \(countryName)")
                return
            }
            
            let mapZoom = MKCoordinateSpan(latitudeDelta: 30.0, longitudeDelta: 30.0)
            let visibleRegion = MKCoordinateRegion(center: location.coordinate, span: mapZoom)
            
            DispatchQueue.main.async {
                self.countryMapView.setRegion(visibleRegion, animated: true)
            }
        }
    }
    
}
