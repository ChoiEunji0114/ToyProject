//
//  SecondViewController.swift
//  SimpleTable
//
//  Created by 최은지 on 13/03/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var textToSet: String?
    
    @IBOutlet weak var textLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.textLabel.text = self.textToSet
    }
    

    

}
