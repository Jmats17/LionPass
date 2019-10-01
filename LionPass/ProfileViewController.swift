//
//  ProfileViewController.swift
//  LionPass
//
//  Created by Justin Matsnev on 10/1/19.
//  Copyright © 2019 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController {
    
    @IBOutlet var nameLbl : UILabel!
    @IBOutlet var emailLbl : UILabel!
    @IBOutlet var idLbl : UILabel!
    @IBOutlet var cardImgView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfile()
    }
    
    private func loadProfile() {
        let profile = RealmService.retrieveProfile()
        nameLbl.text = profile.name
        emailLbl.text = profile.email
        idLbl.text = "\(profile.psuNumber)"
        if let img = profile.idImage {
            cardImgView.image = UIImage(data: img)
        } else {
            print("none")
        }
    }
}
