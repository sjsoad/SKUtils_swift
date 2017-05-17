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
    
    //MARK: - test data
    
    class func mapTestJSONToDatabase() {
        if let filePath = Bundle.main.path(forResource: "testJSON", ofType: "txt") {
            let json = try! String(contentsOfFile: filePath)
            if let data = json.data(using: String.Encoding.utf8) {
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
                    print(dictionary)
                } catch let error as NSError {
                    print(error)
                }
            }
        }
    }
    
    //MARK: - Methods
    
    class func configureRealm() {
        var config = Realm.Configuration()
        config.deleteRealmIfMigrationNeeded = true
        Realm.Configuration.defaultConfiguration = config
        
        print(Realm.Configuration.defaultConfiguration.fileURL?.absoluteString)
    }
    
    class func logout() {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(GitHubUser))
        }
    }
    
    class func addObjectFromJSON<T: RealmSwift.Object>(_ fromJSON: AnyObject?, type: T.Type) {
        let realm = try! Realm()
        if let json = fromJSON {
            try! realm.write {
                realm.create(type, value: json, update: true)
            }
        }
    }
    
}
