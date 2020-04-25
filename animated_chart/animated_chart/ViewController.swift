//
//  ViewController.swift
//  animated_chart
//
//  Created by 최은지 on 25/04/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var chartView: MacawChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        chartView.contentMode = .scaleAspectFit
        
    }
    
    @IBAction func showChartButtonTapped(_ sender: UIButton) {
        MacawChartView.playAnimations()
    }

}

