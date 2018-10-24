//
//  MainPageTableViewController.swift
//  Video Game Library iOS
//
//  Created by Alex Richardson on 10/16/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import UIKit

class MainPageTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentGame: VideoGame!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return GameManager.sharedInstance.getGameCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "splinter cell") as! MainPageTableViewCell
        
        let currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
        
        cell.gameLabel.text = currentGame.title
        
        cell.genreLabel.text = currentGame.genre
        
        cell.ratingLabel.text = currentGame.rating
        
        
        if currentGame.checkedIn {
            
            cell.statusView.backgroundColor = UIColor.green
            
        } else {
            
            cell.statusView.backgroundColor = UIColor.red
            
        }
        
        if let dueDate = currentGame.dueDate {
            
            cell.dueDateLabel.text = formatDate(dueDate)
            
        } else {
            
            cell.dueDateLabel.text = ""
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //this allows us to return an array of actions that the row will have (if any)
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
            
            //remove the game from current index from our game
            
            GameManager.sharedInstance.removeGameAtIndex(index: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let gameForIndex = GameManager.sharedInstance.getGame(at: indexPath.row)
        
        let title = gameForIndex.checkedIn ? "Check Out" : "Check In"
        
        let checkOutOrInAction = UITableViewRowAction(style: .normal, title: title) { (_, _) in
            
            GameManager.sharedInstance.checkGameInOrOut(at: indexPath.row)
            
            tableView.reloadRows(at: [indexPath], with: .fade)
            
        }
        
        let showEditScreenAction = UITableViewRowAction(style: .normal, title: "Edit") { (_, _) in
            
            self.currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
            
            self.performSegue(withIdentifier: "EditGameScreen", sender: self)
        }
        
        showEditScreenAction.backgroundColor = UIColor.blue
        
        return [deleteAction, checkOutOrInAction, showEditScreenAction]
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? EditGameViewController {
            
            destination.gameToEdit = currentGame
            
        }
        
    }
    
    @IBAction func unwindToGameList(segue: UIStoryboardSegue) { }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
