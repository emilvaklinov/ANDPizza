//
//  MapViewController.swift
//  HuliPizza
//
//  Created by Emil Vaklinov on 08/07/2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var latitude:CLLocationDegrees = 40.8371
    var longitude:CLLocationDegrees = 14.2467
    var regionRadius:CLLocationDistance = 1000000
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapView = MKMapView()
        mapView.frame = view.frame
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        mapView.setRegion(MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius),animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        view.addSubview(mapView)
    }
}
