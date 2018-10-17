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
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let checkOutAction = UITableViewRowAction(style: .normal, title: "Check out", handler: (GameManager.sharedInstance.checkOutGame(at: indexPath.row) -> Void))
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        tableView.reloadData()
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
