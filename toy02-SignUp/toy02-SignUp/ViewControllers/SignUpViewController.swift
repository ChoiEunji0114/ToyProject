//
//  SignUpViewController.swift
//  toy02-SignUp
//
//  Created by 최은지 on 12/03/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tap gesture
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
        
        // image click
        profileImageView.isUserInteractionEnabled = true
        let event = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        profileImageView.addGestureRecognizer(event)
        
        // image picker
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func goNext(_ sender: UIButton) {
        
        if self.passwordTextField.text == self.passwordConfirmTextField.text {
            
            UserInformation.shared.id = self.idTextField.text
            UserInformation.shared.password = self.passwordTextField.text
            
            let dvc = storyboard?.instantiateViewController(identifier: "SignUp2ViewController") as! SignUp2ViewController
            dvc.modalPresentationStyle = .fullScreen
            
            self.present(dvc, animated: true, completion: nil)
            
        }
        
    }
    
    @objc func selectImage(){
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var newImage: UIImage? = nil
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage
        }
        
        self.profileImageView.image = newImage
        picker.dismiss(animated: true, completion: nil)
        
    }
}
