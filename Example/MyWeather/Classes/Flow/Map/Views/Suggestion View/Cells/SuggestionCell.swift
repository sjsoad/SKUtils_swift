//
//  SuggestionCell.swift
//  MyWeather
//
//  Created by Mac on 15.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class SuggestionCell: UITableViewCell, ConfigurableCell {

    //MARK: - Properties
    
    @IBOutlet weak var suggestionPrimaryText: UILabel!
    @IBOutlet weak var suggestionSecondaryText: UILabel!
    
    //MARK: - Functions
    
    internal func configure<T>(viewModel: T) {
        if let suggestionVM = viewModel as? SuggestionCellViewModel {
            suggestionPrimaryText.text = suggestionVM.suggestiondPrimaryText()
            suggestionSecondaryText.text = suggestionVM.suggestionSecondaryText()
        }
    }
}
