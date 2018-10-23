//
//  GameManager.swift
//  Video Game Library iOS
//
//  Created by Alex Richardson on 10/17/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation
import RealmSwift
import UserNotifications

class GameManager {
    
    //shared instance of GameManager
    static let sharedInstance = GameManager()
    
    //No other file will be able to make instances of this class
    private init() {
        
        gameArray = realm.objects(VideoGame.self)
        
    }
    
    
    private var gameArray: Results<VideoGame>!
    
    let realm = try! Realm()
    
    
    func getGameCount() -> Int {
        
        return gameArray.count
        
    }
    
    //return game at a specific index
    func getGame(at index: Int) -> VideoGame {
        
        return gameArray[index]
        
    }
    
    func addGame(game: VideoGame) {
        
        try! realm.write {
            realm.add(game)
        }
        
    }
    
    func checkOutGame(at index: Int) {
        
        gameArray[index].checkedIn = false
        
    }
    
    func removeGameAtIndex(index: Int) {
        
        try! realm.write {
            realm.delete(getGame(at: index))
        }
        
    }
    
    func checkGameInOrOut (at index: Int) {
        
        let gameForIndex = gameArray[index]
        
        try! realm.write {
            
            gameForIndex.checkedIn = !gameForIndex.checkedIn
        
            if gameForIndex.checkedIn {
                
                gameForIndex.dueDate = nil
                
            } else {
                
                gameForIndex.dueDate = Calendar.current.date(byAdding: .day, value: 5, to: Date())
                
                let center = UNUserNotificationCenter.current()
                
                let content = UNMutableNotificationContent()
                
                content.title = gameForIndex.title
                
                content.body = "Your game is due"
                
                let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: gameForIndex.dueDate!)
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
                
                let identifier = gameForIndex.title
                
                let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                
                center.add(request, withCompletionHandler: { error in
                    if let error = error {
                        
                        print(error.localizedDescription)
                    }
                })
            }
        }
        
    }
    
}
