//
//  UIView+Decorator.swift
//  Nioxin
//
//  Created by Evgeniy Leychenko on 21.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit

// implementation is not similar to Decorator pattern
// it is more like Visitor pattern, but all decorators are used to modify ui appearance

protocol Decorator {
    
    func decorate<Object>(component: Object)
}

extension NSObject {
    
    func decorate(with decorator: Decorator) {
        decorator.decorate(component: self)
    }
}
