//
//  FavoriteViewController.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 24.04.2022.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var inCatalogBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.inCatalogBtn.layer.masksToBounds = true
        self.inCatalogBtn.layer.cornerRadius = 4
        
       
    }


    

}
