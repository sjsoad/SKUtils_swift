//
//  TableViewRowEditing.swift
//  New Data Source
//
//  Created by Sergey on 18.10.17.
//Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

protocol TableViewRowEditing: class {
    
    var edititngHandler: ((_ editingStyle: UITableViewCellEditingStyle, _ indexPath: IndexPath) -> Void)? { get }
}
