//
//  Optional.swift
//  Yada
//
//  Created by Sergey on 21.03.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    var nilIfEmpty: String? {
        guard let strongSelf = self else {
            return nil
        }
        return strongSelf.isEmpty ? nil : strongSelf
    }
}
