//
//  SignUp2ViewController.swift
//  toy02-SignUp
//
//  Created by 최은지 on 12/03/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class SignUp2ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var birthLabel: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // tap gesture
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
        
        // date picker
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        
        // initial birth label setting
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        self.birthLabel.text = dateString
    }
    

    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        self.birthLabel.text = dateString
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        UserInformation.shared.date = self.dateFormatter.string(from: self.datePicker.date)
        UserInformation.shared.phone = self.phoneTextField.text
        
        // move to login page
        let dvc = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        dvc.modalPresentationStyle = .fullScreen
        
        self.present(dvc, animated: true, completion: nil)
    }
    

}
