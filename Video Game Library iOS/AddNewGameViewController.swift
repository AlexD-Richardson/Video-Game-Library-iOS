//
//  AddNewGameViewController.swift
//  Video Game Library iOS
//
//  Created by Alex Richardson on 10/16/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import UIKit

class AddNewGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var genrePicker: UIPickerView!
    
    @IBOutlet weak var titleOfGame: UITextField!

    @IBOutlet weak var ratingChooser: UISegmentedControl!
    
    
    var pickerData: [String] = ["Action/Adventure", "Sandbox", "Role-Playing Game", "First-Person Shooter", "Open World", "Platformer", "Fighting", "Strategy", "Hack 'n Slash", "Stealth"]
    
    var rating = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        guard titleOfGame.text!.trimmingCharacters(in: .whitespacesAndNewlines) != ("") else {
            
                return showErrorAlert()
            
            }
        
        
        
        let selectedGenre = pickerData[genrePicker.selectedRow(inComponent: 0)]
        
        if ratingChooser.selectedSegmentIndex == 0 {
            
            rating = "E"
            
        } else if ratingChooser.selectedSegmentIndex == 1 {
            
            rating = "T"
            
        } else {
            
            rating = "M"
            
        }
        
        
        let newGame = VideoGame()
        
        newGame.title = titleOfGame.text!
        
        newGame.genre = selectedGenre
        
        newGame.rating = rating
        
        GameManager.sharedInstance.addGame(game: newGame)
        
        
        
        self.performSegue(withIdentifier: "unwindToGameList", sender: self)
        
    }
    
    func showErrorAlert() {
        
        let emptyFieldAlert = UIAlertController(title: "Empty Title", message: "Please enter in the title of the game", preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: "close", style: .default)
        
        emptyFieldAlert.addAction(closeAction)
        
        
        self.present(emptyFieldAlert, animated: true, completion: nil)
        
    }

    
    /*
     
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
