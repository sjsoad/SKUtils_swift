//
//  DatabaseManager.swift
//  SKUtilsSwift
//
//  Created by Mac on 04.08.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseManager: NSObject {
    
    class func logout() {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(GitHubUser))
        }
    }
    
    class func addObjectFromJSON<T: RealmSwift.Object>(fromJSON: AnyObject?, type: T.Type) {
        let realm = try! Realm()
        if let json = fromJSON {
            try! realm.write {
                realm.create(type, value: json, update: true)
            }
        }
    }
    
}
