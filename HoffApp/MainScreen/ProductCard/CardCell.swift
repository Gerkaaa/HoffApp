//
//  CardCell.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 14.04.2022.
//

import UIKit
import Cosmos
import SDWebImage
import SwiftEntryKit

class CardCell: UICollectionViewCell {
    
    var mainProductGalleryCellId = "MainProductGalleryCVCell"
    var presenter: MainViewPresenterProtocol!

    @IBOutlet weak var productCellView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productGallery: UICollectionView!
    @IBOutlet weak var currentPrice: UILabel!
    @IBOutlet weak var oldPrice: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productStatus: UILabel!
    @IBOutlet weak var productDiscount: UILabel!
    @IBOutlet weak var productTag: UILabel!
    @IBOutlet weak var numberOfProductReviews: UILabel!
    @IBOutlet weak var favouritesBtn: UIButton!
    
    var currentItem: Product?
    
    lazy var cosmosView: CosmosView = {

        var view = Cosmos.CosmosView()
        view.settings.updateOnTouch = false
        view.settings.fillMode = .precise
        view.settings.starSize = 16
        view.settings.starMargin = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view

    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.oldPrice.attributedText = NSAttributedString(string: "999", attributes: [NSAttributedString.Key.strikethroughStyle:NSUnderlineStyle.single.rawValue])
        self.productDiscount.layer.masksToBounds = true
        self.productDiscount.layer.cornerRadius = 4
        
        contentView.addSubview(cosmosView)
        NSLayoutConstraint.activate([
            cosmosView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            cosmosView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22),
        ])
        
    }
    
    @IBAction func favouritesBtn(_ sender: UIButton) {
        
        guard let currentItem = self.currentItem else { return }
        
        if Favourite.shared.checkFavoriteOnClick(productItem: currentItem) {
            favouritesBtn.setImage(UIImage(named: "favourites-active-icon"), for: .normal)
        } else {
            favouritesBtn.setImage(UIImage(named: "favourites-icon"), for: .normal)
            }
        
    }
    
    
    func configure(product: Product, cell: CardCell) {
        
//        let nibCell = UINib(nibName: mainProductGalleryCellId, bundle: nil)
//        productGallery.register(nibCell, forCellWithReuseIdentifier: mainProductGalleryCellId)
        
        currentItem = product
        
        productTitle.text = product.name
        currentPrice.text = "\(String(product.prices.new )) ₽"
        oldPrice.text = "\(String(product.prices.old )) ₽"
        productDiscount.text = "\(String(product.discount ?? 0)) %"
        productTag.text = String(product.tag?[0].text ?? "")
        productStatus.text = product.statusText
        numberOfProductReviews.text = "(\(String(product.numberOfReviews ?? "")))"
        cosmosView.rating = Double(product.rating ?? 0)
        
        var str = product.image
        if str.count > 0 {
        let range = str.index(str.startIndex, offsetBy: 8)..<str.index(str.startIndex, offsetBy: 17)
        str.removeSubrange(range)

        productImage.sd_setImage(with: URL(string: str))

//            if Favourite.shared.isFavorite(productItem: product) {
//                favouritesBtn.setImage(UIImage(named: "favourites-active-icon"), for: .normal)
//            } else {
//                favouritesBtn.setImage(UIImage(named: "favourites-icon"), for: .normal)
//            }
//
        
        
    }
    
}

// MARK: Gallery

//extension CardCell: UICollectionViewDelegate, UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return presenter.product?.images?.count ?? 0
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainProductGalleryCellId, for: indexPath) as? MainProductGalleryCVCell else { return UICollectionViewCell() }
//
//        let productItem = (presenter.product?.images?[indexPath.row])!
//
//        var str = productItem
//
//        let range = (str.index(str.startIndex, offsetBy: 8))..<(str.index(str.startIndex, offsetBy: 17))
//        str.removeSubrange(range)
//
//        cell.productGalleryImage.sd_setImage(with: URL(string: str))
//
//        return cell
//    }
//
//
//}
}
