//
//  MapViewController.swift
//  MyWeather
//
//  Created by Mac on 13.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var searchView: MapSearchView!
    
    var mapVM = MapViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(mapView: mapView)
        bindForSuggestionChanges()
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Binding
    
    func bindForSuggestionChanges() {
        searchView.suggestionView.didChangeSuggestions.bind { [weak self] (didChangeSuggestions) in
            guard let strongSelf = self else { return }
            if let suggestionVM = strongSelf.searchView.suggestionView.arrayDataVM, didChangeSuggestions {
                strongSelf.bindForSuggestionSelection(viewModel: suggestionVM)
            }
        }
    }
    
    func bindForSuggestionSelection(viewModel: SuggestionViewModel) {
        viewModel.selectedSuggestion.bind(l: { [weak self] (selectedSuggestion) in
            guard let strongSelf = self else { return }
            if let suggestion = selectedSuggestion {
                strongSelf.place(forSuggestion: suggestion)
                strongSelf.searchView.dissmis()
            }
        })
    }
    
    //MARK: - GMSPlace
    
    func place(forSuggestion suggestion: GMSAutocompletePrediction) {
        self.mapVM.place(forPlaceId: suggestion.placeID,
                         completion: { [weak self] (gmPlace) in
                            guard let strongSelf = self else { return }
                           strongSelf.add(markerForPalce: gmPlace)
        })
    }
    
    //MARK: - Map
    
    func configure(mapView: GMSMapView) {
        if let location = appDelegate.locationSerice.location {
            let camera = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: 8)
            mapView.camera = camera
            mapView.settings.myLocationButton = false
            mapView.settings.compassButton = false
            mapView.settings.rotateGestures = false
            
        }
    }
    
    func add(markerForPalce place: GMSPlace) {
        let marker = mapVM.locationMarker(forPlace: place)
        show(marker: marker)
    }
    
    func show(marker: GMSMarker) {
        mapView.clear()
        marker.map = mapView
        let cameraUpdate = GMSCameraUpdate.setTarget(marker.position, zoom: 10)
        mapView.animate(with: cameraUpdate)
    }
}
