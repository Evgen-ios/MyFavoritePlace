//
//  MapViewController.swift
//  MyPlaces
//
//  Created by Евгений on 04.07.2020.
//  Copyright © 2020 Evgen Goncharov. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    
    var place : Place!
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlacemark()

    }

    @IBAction func closeVC() {
        dismiss(animated: true)
    }
    
    private func setupPlacemark(){
        
        guard  let location = place.location else { return }
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString (location) { (placemarks, error) in
            
            if let error = error{
                print(error)
                return
            }
            
            guard let placemarks = placemarks else {return}
            
            let placemark = placemarks.first
            
            let annotatinon = MKPointAnnotation()
            
            annotatinon.title = self.place.name
            annotatinon.subtitle = self.place.type
            
            guard let placemarklocation = placemark?.location else { return }
            annotatinon.coordinate = placemarklocation.coordinate
            
            self.mapView.showAnnotations([annotatinon], animated: true)
            self.mapView.selectAnnotation(annotatinon, animated: true)
        }
    }
    
}
