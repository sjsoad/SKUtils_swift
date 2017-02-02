//
//  MapSearchView+UItextFieldDelegate.swift
//  MyWeather
//
//  Created by Mac on 15.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

extension MapSearchView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchVM.search(text: textField.text)
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func textDidChange(textField: UITextField) {
        searchVM.search(text: textField.text)
    }
    
}
