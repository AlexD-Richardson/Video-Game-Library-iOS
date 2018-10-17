//
//  Video Game.swift
//  Video Game Library iOS
//
//  Created by Alex Richardson on 10/16/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

class VideoGame {
    
    let title: String
    
    let genre: String
    
    let rating: String
    
    var checkedIn: Bool
    
    var dueDate: Date?
    
    init(title: String, genre: String, rating: String) {
        
        self.title = title
        
        self.genre = genre
        
        self.rating = rating
        
        self.checkedIn = true
        
    }
    
    
    
}
