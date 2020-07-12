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
    let annotationIdentifer = "annotationIdentifer"
    
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
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


extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard  !(annotation is MKUserLocation) else { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView( withIdentifier: annotationIdentifer ) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifer)
            annotationView?.canShowCallout = true
        }
        if let imageDate = place.imageData {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(data: imageDate)
            annotationView?.rightCalloutAccessoryView = imageView
            
        }
        
        return annotationView
        
    }
}
