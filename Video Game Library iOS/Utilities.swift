//
//  Utilities.swift
//  Video Game Library iOS
//
//  Created by Alex Richardson on 10/18/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

func formatDate(_ date: Date) -> String {
    
    let dateFormatter = DateFormatter()
    
    //allows to set different default date styles
    //dateFormatter.dateStyle = .medium
    
    dateFormatter.dateFormat = "MMM d, yyyy"
    
    let formattedString = dateFormatter.string(from: date)
    
    return formattedString
    
}
