//
//  LoginViewController.swift
//  toy02-SignUp
//
//  Created by 최은지 on 12/03/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIGestureRecognizerDelegate {

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
    
    @IBAction func goSignUp(_ sender: UIButton) {
        
        let dvc = storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        dvc.modalPresentationStyle = .fullScreen
        
        self.present(dvc, animated: true, completion: nil)
        
    }
    

}
