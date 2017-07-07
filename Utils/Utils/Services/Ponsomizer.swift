//
//  Ponsomizer.swift
//  HIYR
//
//  Created by Evgeniy Leychenko on 02.12.16.
//  Copyright © 2016 theappsolutions.com. All rights reserved.
//

import Foundation
import CoreData

// converting Core Data objects into plain objects
// and vica versa

protocol Ponsomizable {
    
    func plainObject() -> AnyObject
    func setup(from plainObject: AnyObject)
}

protocol Ponsomizing {
    
    func ponsomize(_ ponsomizableObjects: [Ponsomizable]) -> [AnyObject]
    func ponsomize(_ ponsomizableObject: Ponsomizable) -> AnyObject
    func fill(ponsomizable: Ponsomizable, from plainObject: AnyObject)
}

class Ponsomizer: Ponsomizing {
    
    func ponsomize(_ ponsomizableObjects: [Ponsomizable]) -> [AnyObject] {
        return ponsomizableObjects.flatMap({ return ponsomize($0) })
    }
    
    func ponsomize(_ ponsomizableObject: Ponsomizable) -> AnyObject {
        return ponsomizableObject.plainObject()
    }
    
    func fill(ponsomizable: Ponsomizable, from plainObject: AnyObject) {
        ponsomizable.setup(from: plainObject)
    }
}
