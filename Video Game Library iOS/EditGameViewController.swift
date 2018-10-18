//
//  EditGameViewController.swift
//  Video Game Library iOS
//
//  Created by Alex Richardson on 10/18/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import UIKit

class EditGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var ratingPicker: UISegmentedControl!

    @IBOutlet weak var genrePicker: UIPickerView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var gameToEdit: VideoGame!
    
    var pickerData: [String] = ["Action/Adventure", "Sandbox", "Role-Playing Games", "First-Person Shooter", "Open World", "Platformer", "Fighting", "Real-Time Strategy", "Hack 'n Slash", "Stealth"]
    
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
        
        if gameToEdit.genre == "RPG" {
            genrePicker.selectRow(0, inComponent: 0, animated: false)
        }
        

        // Do any additional setup after loading the view.
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
