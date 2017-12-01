//
//  LocalDataStorage.swift
//  Nioxin
//
//  Created by Evgeniy Leychenko on 22.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import Foundation
import CoreData
import AERecord

protocol LocalDataStorage {
    
    func fetchAll<ManagedType: NSManagedObject>(from objectsClass: ManagedType.Type,
                                                withPredicate predicate: NSPredicate?,
                                                orderedBy sortDescriptors: [NSSortDescriptor]?) -> [ManagedType]?
    func fetchOne<ManagedType: NSManagedObject>(from objectClass: ManagedType.Type,
                                                withPredicate predicate: NSPredicate?) -> ManagedType?
    @discardableResult func create<ManagedType: NSManagedObject>(into: ManagedType.Type,
                                                                 quantity: Int,
                                                                 with setup:@escaping (Int, ManagedType) -> Void) -> [ManagedType]
    func updateObjects<ManagedType: NSManagedObject>(from: ManagedType.Type,
                                                     predicate: NSPredicate?,
                                                     with update:@escaping (Int, ManagedType) -> Void)
    func delete<ManagedType: NSManagedObject>(from objectsClass: ManagedType.Type, withPredicate predicate: NSPredicate?)
    func save()
}

class DefaultLocalDataStorage {
    
    static func initialize() {
        do {
            try AERecord.loadCoreDataStack()
        } catch {
            print(error)
            fatalError()
        }
    }
    
}

extension DefaultLocalDataStorage: LocalDataStorage {
    
    func fetchAll<ManagedType: NSManagedObject>(from objectsClass: ManagedType.Type,
                                                withPredicate predicate: NSPredicate? = nil,
                                                orderedBy sortDescriptors: [NSSortDescriptor]? = nil) -> [ManagedType]? {
        if let predicate = predicate {
            return ManagedType.all(with: predicate, orderedBy: sortDescriptors, in: AERecord.Context.default)
        } else {
            return ManagedType.all(orderedBy: sortDescriptors, in: AERecord.Context.default)
        }
    }
    
    func fetchOne<ManagedType: NSManagedObject>(from objectClass: ManagedType.Type,
                                                withPredicate predicate: NSPredicate? = nil) -> ManagedType? {
        if let predicate = predicate {
            return ManagedType.first(with: predicate)
        } else {
            return ManagedType.first()
        }
    }
    
    @discardableResult
    func create<ManagedType: NSManagedObject>(into: ManagedType.Type,
                                              quantity: Int,
                                              with setup:@escaping (Int, ManagedType) -> Void) -> [ManagedType] {
        var createdObjects: [ManagedType] = []
        for index  in 0..<quantity {
            let managedObject = ManagedType.create()
            setup(index, managedObject)
            createdObjects.append(managedObject)
        }
        
        save()
        
        return createdObjects
    }
    
    func updateObjects<ManagedType: NSManagedObject>(from: ManagedType.Type,
                                                     predicate: NSPredicate? = nil,
                                                     with update:@escaping (Int, ManagedType) -> Void) {
        guard let objectsToUpdate = fetchAll(from: ManagedType.self, withPredicate: predicate, orderedBy: nil) else {
            return
        }
        
        for (index, object) in objectsToUpdate.enumerated() {
            update(index, object)
        }
        
        save()
    }
    
    func delete<ManagedType: NSManagedObject>(from objectsClass: ManagedType.Type, withPredicate predicate: NSPredicate? = nil) {
        if let predicate = predicate {
            ManagedType.deleteAll(with: predicate)
        } else {
            ManagedType.deleteAll()
        }
        save()
    }
    
    func save() {
        AERecord.saveAndWait()
    }
    
}
