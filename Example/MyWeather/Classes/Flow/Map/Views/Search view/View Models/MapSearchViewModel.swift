//
//  MapSearchViewModel.swift
//  MyWeather
//
//  Created by Mac on 15.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import GooglePlaces

class MapSearchViewModel: NSObject {
    
    var places: [GMSAutocompletePrediction]?
    var placesClient: GMSPlacesClient?
    var updateUI: Dynamic<Bool> = Dynamic(false)
    
    func search(text: String?) {
        cancelSearch()
        if let searchText = text {
            if (searchText.characters.count > 0) {
                let filter = GMSAutocompleteFilter()
                filter.type = .geocode
                placesClient = GMSPlacesClient()
                placesClient!.autocompleteQuery(searchText,
                                                bounds: nil,
                                                filter: filter,
                                                callback: { [weak self] (result, error) in
                                                    guard let strongSelf = self else { return }
                                                    if let error = error {
                                                        print("Autocomplete error \(error)")
                                                    }
                                                    strongSelf.places = result
                                                    strongSelf.updateUI.value = true
                })
            }
            else {
                updateUI.value = true
            }
        }
    }
    
    func cancelSearch() {
        places = nil
        placesClient = nil
    }

    func suggestionViewModel() -> SuggestionViewModel {
        if let places = places {
            return SuggestionViewModel(array: places)
        }
        return SuggestionViewModel(array: [])
    }
    
}

