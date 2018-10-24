//
//  Video Game.swift
//  Video Game Library iOS
//
//  Created by Alex Richardson on 10/16/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation
import RealmSwift

class VideoGame: Object {
    
    @objc dynamic var title: String = ""
    
    @objc dynamic var genre: String = ""
    
    @objc dynamic var rating: String = ""
    
    @objc dynamic var checkedIn: Bool = true
    
    @objc dynamic var dueDate: Date? = nil
    
}
