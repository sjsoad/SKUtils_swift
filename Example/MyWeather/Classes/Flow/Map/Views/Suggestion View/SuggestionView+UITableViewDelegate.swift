//
//  SuggestionView+UITableViewDelegate.swift
//  MyWeather
//
//  Created by Mac on 19.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

extension SuggestionView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let suggestionVM = arrayDataVM {
            suggestionVM.selectItem(atIndexPath: indexPath)
        }
    }

}
