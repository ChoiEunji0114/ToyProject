//
//  ViewController.swift
//  toy03-Weather
//
//  Created by 최은지 on 17/03/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let countryCellIdentifier: String = "countryCell"
    
    
    
    
    @IBOutlet weak var countryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.countryTableView.delegate = self
        self.countryTableView.dataSource = self
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}

