//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Work Out on 05.06.2020.
//  Copyright © 2020 Evgen Goncharov. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place) {
        
        try! realm.write {
            realm.add(place)
        }
    }
    
    static func deliteObject(_ place: Place){
        
        try! realm.write {
            realm.delete(place)
        }
    }
}
