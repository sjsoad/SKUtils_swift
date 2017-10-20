//
//  DataSourceRepresentable.swift
//  New Data Source
//
//  Created by Sergey on 18.10.17.
//Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

protocol DataSourceRepresentable {

    func numberOfSections() -> Int
    func numberOfItemsInSection(sectionIndex: Int) -> Int
    func itemAtIndexPath(indexPath: IndexPath) -> DataSourceModel?
    
}
