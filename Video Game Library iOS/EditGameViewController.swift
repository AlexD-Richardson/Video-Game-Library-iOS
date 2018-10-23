//
//  EditGameViewController.swift
//  Video Game Library iOS
//
//  Created by Alex Richardson on 10/18/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import UIKit
import RealmSwift

class EditGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var ratingPicker: UISegmentedControl!

    @IBOutlet weak var genrePicker: UIPickerView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var gameToEdit: VideoGame!
    
    var pickerData: [String] = ["Action/Adventure", "Sandbox", "Role-Playing Game", "First-Person Shooter", "Open World", "Platformer", "Fighting", "Real-Time Strategy", "Hack 'n Slash", "Stealth"]
    
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
        
        titleTextField.text = gameToEdit.title
        
        switch gameToEdit.genre {
            
        case "Action/Adventure": genrePicker.selectRow(0, inComponent: 0, animated: false)
            
        case "Sandbox": genrePicker.selectRow(1, inComponent: 0, animated: false)
            
        case "Role-Playing Games": genrePicker.selectRow(2, inComponent: 0, animated: false)
            
        case "First-Person Shooter": genrePicker.selectRow(3, inComponent: 0, animated: false)
            
        case "Open World": genrePicker.selectRow(4, inComponent: 0, animated: false)
            
        case "Platformer": genrePicker.selectRow(5, inComponent: 0, animated: false)
            
        case "Fighting": genrePicker.selectRow(6, inComponent: 0, animated: false)
            
        case "Strategy": genrePicker.selectRow(7, inComponent: 0, animated: false)
            
        case "Hack 'n Slash": genrePicker.selectRow(8, inComponent: 0, animated: false)
            
        case "Stealth": genrePicker.selectRow(9, inComponent: 0, animated: false)
            
            
        default: genrePicker.selectRow(0, inComponent: 0, animated: false)
            
        }
        
        switch gameToEdit.rating {
            
        case "E": ratingPicker.selectedSegmentIndex = 0
            
        case "T": ratingPicker.selectedSegmentIndex = 1
            
        case "M": ratingPicker.selectedSegmentIndex = 2
            
        default: ratingPicker.selectedSegmentIndex = 1
            
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        let realm = try! Realm()
        
        try! realm.write {
            
            gameToEdit.title = titleTextField.text!
            gameToEdit.genre = pickerData[genrePicker.selectedRow(inComponent: 0)]
            switch ratingPicker.selectedSegmentIndex {
                
            case 0: gameToEdit.rating = "E"
                
            case 1: gameToEdit.rating = "T"
                
            case 2: gameToEdit.rating = "M"
                
            default: gameToEdit.rating = "M"
                
            }
            
            
        }
        
        self.performSegue(withIdentifier: "unwindToGameList", sender: self)
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
