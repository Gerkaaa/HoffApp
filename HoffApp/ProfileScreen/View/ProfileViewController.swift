//
//  ProfileViewController.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 24.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loginBtn.layer.masksToBounds = true
        self.loginBtn.layer.cornerRadius = 4
        
    }

}
