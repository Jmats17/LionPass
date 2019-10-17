//
//  HomeViewController.swift
//  LionPass
//
//  Created by Justin Matsnev on 10/15/19.
//  Copyright © 2019 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit
import GradientProgressBar
import DeckTransition

class HomeViewController: UIViewController {
    
    @IBOutlet var mealView : UIView!
    @IBOutlet var gymView : UIView!
    
    @IBOutlet var mealPointsLbl : UILabel!
    @IBOutlet var lioncashLbl : UILabel!
    @IBOutlet var numGymLbl : UILabel!
    @IBOutlet var nameLbl : UILabel!
    @IBOutlet var yearLbl : UILabel!
    
    @IBOutlet var mealBalanceProgressView : UIView!
    @IBOutlet var gymProgressView : UIView!
    
    @IBOutlet var userImgView : UIImageView!
    
    @IBOutlet var scanButton : UIButton!
    
    let profile = RealmService.retrieveProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        nameLbl.text = profile.name
        if let img = profile.idImage {
            userImgView.image = UIImage(data: img)
        }
    }
    
    @IBAction func scanID(sender : UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(
                                  withIdentifier: "scannerView") as! ScannerViewController
        let transitionDelegate = DeckTransitioningDelegate()
        viewController.transitioningDelegate = transitionDelegate
        viewController.modalPresentationStyle = .custom
        self.present(viewController, animated: true, completion: nil)
    }
    
    private func createViewShadow(view : UIView) {
        view.layer.shadowColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1.0).cgColor
        view.layer.shadowOpacity = 1.0
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        view.layer.cornerRadius = 10.0
    }
    
    private func setupUI() {
        createViewShadow(view: mealView)
        createViewShadow(view: gymView)
        
        userImgView.layer.masksToBounds = false
        userImgView.layer.cornerRadius = 10.0
        userImgView.clipsToBounds = true
        
        createProgressBar(view: mealBalanceProgressView)
        
        scanButtonUI()
    }
    
    private func scanButtonUI() {
        scanButton.layer.borderWidth = 2.0
        scanButton.layer.borderColor = UIColor(red: 30/255, green: 64/255, blue: 124/255, alpha: 1.0).cgColor
        scanButton.layer.cornerRadius = 7.0
        scanButton.layer.shadowColor = UIColor.lightGray.cgColor
        scanButton.layer.shadowOpacity = 0.3
        scanButton.layer.shadowOffset = .zero
        scanButton.layer.shadowRadius = 10
    }
    
    private func createProgressBar(view : UIView) {
        let progressBar = GradientProgressBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        progressBar.setProgress(0.75, animated: true)
        progressBar.gradientColors = [
            UIColor(red: 30/255, green: 64/255, blue: 124/255, alpha: 1.0),
            UIColor(red: 165/255, green: 179/255, blue: 203/255, alpha: 1.0),
        ]
        view.addSubview(progressBar)
    }
}
