//
//  ViewController.swift
//  4ahitm-medtmc-u3-address_table
//
//  Created by Quirin Ecker on 23.10.20.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var streetField: UITextField!
    @IBOutlet weak var placeField: UITextField!
    @IBOutlet weak var zibField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveEntry(_ sender: Any) {
        
        let regex = try! NSRegularExpression(pattern: "^(AT-*[0-9])", options: [])
        
        if firstNameField.text != nil
            && lastNameField.text != nil
            && streetField.text != nil
            && placeField.text != nil
            && zibField.text != nil
        {
            let zibCodeValid = regex.firstMatch(in: zibField.text!, options: [], range: NSMakeRange(0, zibField.text!.utf16.count)) != nil
            
            if zibCodeValid {
                model.personEntries.append(Person(firstname: firstNameField.text!, lastname: lastNameField.text!, street: streetField.text!, place: placeField.text!, zip: zibField.text!))
            } else {
                print("invalid format for post code (AT-nnnn)")
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "list" {
            let tableViewController = segue.destination as! TableViewController
            
            tableViewController.model = self.model
        }
    }
    
}

