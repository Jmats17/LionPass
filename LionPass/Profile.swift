//
//  Profile.swift
//  LionPass
//
//  Created by Justin Matsnev on 9/29/19.
//  Copyright © 2019 Justin Matsnev. All rights reserved.
//

import Foundation
import RealmSwift

class Profile : Object {
    
    @objc dynamic var name = ""
    @objc dynamic var psuNumber = 0
    @objc dynamic var email = ""
    @objc dynamic var idImage : Data? = nil
    
    
}
