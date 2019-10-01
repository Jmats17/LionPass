//
//  RealmService.swift
//  LionPass
//
//  Created by Justin Matsnev on 9/29/19.
//  Copyright © 2019 Justin Matsnev. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmService {
    
    static let realm = try! Realm()
    
    static func writeToRealm(profile : Profile) {
        try! realm.write {
            realm.add(profile)
        }
    }
    
    static func retrieveProfile() -> Profile {
        return realm.objects(Profile.self)[0] as Profile
    }
}
