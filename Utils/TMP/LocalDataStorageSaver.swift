//
//  LocalDataStorageSaver.swift
//  Place
//
//  Created by Sergey on 29.09.17.
//  Copyright © 2017 the appsolutions. All rights reserved.
//

import UIKit
import CoreData

protocol LocalDataStorageIdentifying {
    
    associatedtype IdentifierType: Any
}

protocol LocalDataStorageModelIdentifying: LocalDataStorageIdentifying {
    
    var identifier: IdentifierType! { get }
    
}

class PlainModel: LocalDataStorageModelIdentifying {
    
    typealias IdentifierType = Int
    var identifier: PlainModel.IdentifierType!
    
}

class ManagedModel: NSManagedObject, Ponsomizable {

    func plainObject() -> AnyObject {
        return PlainModel()
    }
    
    func setup(from plainObject: AnyObject) {
        
    }

}

protocol LocalDataStorageSaverType {
    
    associatedtype ModelType
    associatedtype ModelMOType
}

class LocalDataStorageSaver: NSObject, LocalDataStorageSaverType {
    
    typealias ModelType = PlainModel
    typealias ModelMOType = ManagedModel
    
    static private let dataStorage = LocalDataStorage()
    static private let ponsomizer = Ponsomizer()
    
    static func save(objects: [ModelType]) {
        objects.forEach({ save(object: $0) })
    }
    
    @discardableResult
    static func save(object: ModelType) -> PlainModel.IdentifierType {
        let predicate = NSPredicate(format: "identifier == %@", String(object.identifier))
        if dataStorage.fetchOne(from: ModelMOType.self, withPredicate: predicate) != nil {
            update(object)
        } else {
            create(object)
        }
        
        return object.identifier
    }
    
    // MARK: - Private -
    
    @discardableResult
    static private func update(_ object: ModelType) -> PlainModel.IdentifierType {
        let predicate = NSPredicate(format: "identifier == %@", String(object.identifier))
        dataStorage.updateObjects(from: ModelMOType.self, predicate: predicate, with: { (_, managedObject) in
            ponsomizer.fill(ponsomizable: managedObject, from: object)
        })
        
        return object.identifier
    }
    
    @discardableResult
    static private func create(_ object: ModelType) -> PlainModel.IdentifierType {
        dataStorage.create(into: ModelMOType.self, quantity: 1) { (_, managedObject) in
            ponsomizer.fill(ponsomizable: managedObject, from: object)
        }
        return object.identifier
    }
    
}
