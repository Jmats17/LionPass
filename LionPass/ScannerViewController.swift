//
//  ScannerViewController.swift
//  LionPass
//
//  Created by Justin Matsnev on 10/16/19.
//  Copyright © 2019 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit

class ScannerViewController : UIViewController {
    
    @IBOutlet var knotchView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        knotchView.layer.cornerRadius = 2.0
    }
    
    @IBAction func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
}
