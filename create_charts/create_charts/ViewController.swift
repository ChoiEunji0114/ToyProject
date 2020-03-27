//
//  ViewController.swift
//  create_charts
//
//  Created by 최은지 on 27/03/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var txtTextBox: UITextField!
    @IBOutlet weak var goButton: UIButton!
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    var numbers: [Double] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func addValue(_ sender: UIButton) {
        
        let inputNum = Double(txtTextBox.text!)
        numbers.append(inputNum!)
        
        self.txtTextBox.text = ""
        
        updateGraph()
    }
    
    
    func updateGraph(){
        var lineChartEntry = [ChartDataEntry]() // graph 에 보여줄 data array
        
        // chart data array 에 데이터 추가
        for i in 0..<numbers.count {
            let value = ChartDataEntry(x: Double(i), y: numbers[i])
            lineChartEntry.append(value)
        }
        
        // lineChartEntry to lineChartDataSet
        let line1 = LineChartDataSet(entries: lineChartEntry, label: "Number")
        line1.colors = [NSUIColor.blue]
        
        let data = LineChartData()
        data.addDataSet(line1)
        
        lineChartView.data = data
    
        
    }
    
    
    
}

