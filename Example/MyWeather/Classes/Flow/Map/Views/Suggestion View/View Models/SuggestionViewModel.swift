//
//  SuggestionViewModel.swift
//  MyWeather
//
//  Created by Mac on 15.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import GooglePlaces

class SuggestionViewModel: ArrayTableViewModelProtocol {

    typealias ModelType = GMSAutocompletePrediction
    typealias CellType = SuggestionCell
    
    var arrayData: [GMSAutocompletePrediction]
    var arrayDataSource: TableViewArrayDataSource?
    
    var selectedSuggestion: Dynamic<GMSAutocompletePrediction?> = {
        return Dynamic(nil)
    }()
    
    required init(array: [GMSAutocompletePrediction]) {
        self.arrayData = array
        let suggestions = createViewModels(fromModels: array)
        let sectionModel = SectionModel(withItems: suggestions, header: nil, footer: nil)
        self.arrayDataSource = TableViewArrayDataSource(sections: [sectionModel],
                                                             reuseIdentifier: SuggestionCell.reuseIdentifier)
    }

    func createViewModels(fromModels models: [GMSAutocompletePrediction]) -> [SuggestionCellViewModel] {
        var suggestions = [SuggestionCellViewModel]()
        for suggestionModel in models {
            let suggestionViewModel = SuggestionCellViewModel(model: suggestionModel)
            suggestions.append(suggestionViewModel)
        }
        return suggestions
    }
    
    func selectItem(atIndexPath indexPath: IndexPath) {
        selectedSuggestion.value = arrayData[indexPath.row]
    }
    
}
