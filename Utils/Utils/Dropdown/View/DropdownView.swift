//
//  DropdownView.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 18.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class DropdownView: UIView {

    @IBOutlet private weak var tableView: UITableView!
    
    @IBInspectable var allowsMultipleSelection: Bool = false {
        didSet {
            self.tableView.allowsMultipleSelection = self.allowsMultipleSelection
        }
    }
    
    // MARK: - Private -
    
    private func changeAlpha(of view: UIView, to value: CGFloat, completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: 0.25,
                       animations: {
                        view.alpha = value
        },
                       completion: completion)
    }
    
}
