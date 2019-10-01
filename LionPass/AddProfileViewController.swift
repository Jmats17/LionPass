//
//  AddProfileViewController.swift
//  LionPass
//
//  Created by Justin Matsnev on 9/29/19.
//  Copyright © 2019 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit

class AddProfileViewController : UIViewController {
    
    @IBOutlet var nameTextfield : UITextField!
    @IBOutlet var emailTextfield : UITextField!
    @IBOutlet var idTextfield : UITextField!
    var imagePicker : UIImagePickerController!
    var idImage : Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resignTextfield()
    }
    
    @IBAction func takePicture(sender : UIButton) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func confirm(sender : UIButton) {
        if idImage != nil {
            RealmService.writeToRealm(profile: createProfile())
        }
    }
    
    private func createProfile() -> Profile {
        let profile = Profile()
        profile.name = nameTextfield.text ?? "Nil"
        profile.email = emailTextfield.text ?? "Nil"
        profile.psuNumber = Int(idTextfield.text ?? "0") ?? 0
        profile.idImage = idImage
        
        return profile
    }
}

extension AddProfileViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    private func resignTextfield() {
        nameTextfield.delegate = self
        emailTextfield.delegate = self
        idTextfield.delegate = self

    }
}

extension AddProfileViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        let img = info[.originalImage] as? UIImage
        idImage = img?.jpegData(compressionQuality: 0.8)
    }
}
