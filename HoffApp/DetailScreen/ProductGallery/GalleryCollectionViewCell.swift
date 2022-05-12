//
//  GalleryCollectionViewCell.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 19.04.2022.
//

import UIKit
import SDWebImage

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var galleryPhoto: UIImageView!
    
    static let  identifier = String(describing: GalleryCollectionViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
