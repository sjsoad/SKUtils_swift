//
//  SuggestionCellViewModel.swift
//  MyWeather
//
//  Created by Mac on 15.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import GooglePlaces

class SuggestionCellViewModel: NSObject {

    var suggestionModel: GMSAutocompletePrediction
    
    init(model: GMSAutocompletePrediction) {
        suggestionModel = model
    }
    
    func suggestiondPrimaryText() -> String {
        return suggestionModel.attributedPrimaryText.string
    }
    
    func suggestionSecondaryText() -> String? {
        if let secondaryText = suggestionModel.attributedSecondaryText {
            return secondaryText.string
        }
        return nil
    }
    
}
