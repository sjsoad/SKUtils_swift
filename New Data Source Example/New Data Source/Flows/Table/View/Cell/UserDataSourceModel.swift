//
//  UserDataSourceModel.swift
//  New Data Source
//
//  Created by Sergey on 19.10.17.
//Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

protocol UserCellViewModelDisplaying {
    
    var firstName: String? { get }
    var lastName: String? { get }
    
}

class UserDataSourceModel: DataSourceModel {

    private(set) var reuseIdentifier: String
    private(set) var model: User
    
    init(model: User, reuseIdentifier: String) {
        self.user = model
        self.reuseIdentifier = reuseIdentifier
    }
    
}

extension UserDataSourceModel: UserCellViewModelDisplaying {
    
    var firstName: String? {
        return model.firstName
    }
    var lastName: String? {
        return model.lastName
    }
    
}
