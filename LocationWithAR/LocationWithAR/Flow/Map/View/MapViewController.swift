//
//  MapViewController.swift
//  LocationWithAR
//
//  Created by Sergey on 28.02.2018.
//Copyright © 2018 Sergey. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MapInterface {

    var presenter: MapOutput?

    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        presenter?.viewDidLoad()
    }
    
    // MARK: - MapInterface -
    
    func add(places: [PlaceAnnotation]) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(places)
    }
    
}
