//
//  GameManager.swift
//  Video Game Library iOS
//
//  Created by Alex Richardson on 10/17/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

class GameManager {
    
    //shared instance of GameManager
    static let sharedInstance = GameManager()
    
    //No other file will be able to make instances of this class
    private init() { }
    
    
    private var gameArray: [VideoGame] =
        
        [VideoGame(title: "Fallout 3", genre: "Role-Playing Game", rating: "M"),
         
         VideoGame(title: "Red Dead Redemption", genre: "Open World", rating: "M"),
         
         VideoGame(title: "Batman Arkham City", genre: "Action/Adventure", rating: "T"),
         
         VideoGame(title: "Super Smash Bros Melee", genre: "Fighting", rating: "T")]
    
    func getGameCount() -> Int {
        
        return gameArray.count
        
    }
    
    //return game at a specific index
    func getGame(at index: Int) -> VideoGame {
        
        return gameArray[index]
        
    }
    
    func addGame(game: VideoGame) {
        
        gameArray.append(game)
        
    }
    
    func checkOutGame(at index: Int) {
        
        gameArray[index].checkedIn = false
        
    }
    
}
