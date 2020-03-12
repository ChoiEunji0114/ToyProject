//
//  ViewController.swift
//  toy02-SignUp
//
//  Created by 최은지 on 11/03/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpSetButton(_ sender: UIButton) {
//        UserInformation.shared.name = nameField.text
//        UserInformation.shared.age = ageField.text
    }
    
}

