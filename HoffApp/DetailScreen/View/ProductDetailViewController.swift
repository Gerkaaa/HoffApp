//
//  ProductDetailViewController.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 17.04.2022.
//

import UIKit
import SDWebImage
import Cosmos


class ProductDetailViewController: UIViewController {

    var currentPage: Int = 0
//    var galleryCVCellId = "GalleryCollectionViewCell"
    
    var presenter: ProductDetailViewPresenterProtocol!
    
    @IBOutlet weak var detailCollectionView: UICollectionView!
    @IBOutlet weak var sliderPageControl: UIPageControl!
    
    @IBOutlet weak var productTitleView: UIView!
    @IBOutlet weak var informationView: UIView!
    
    @IBOutlet weak var productDiscount: UILabel!
    @IBOutlet weak var productArticul: UILabel!
    @IBOutlet weak var productColor: UILabel!
    @IBOutlet weak var oldPrice: UILabel!
    @IBOutlet weak var currentPrice: UILabel!
    @IBOutlet weak var productBonuses: UILabel!
    @IBOutlet weak var productBasketBtn: UIButton!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productRating: UILabel!
    @IBOutlet weak var productNumberOfReviews: UILabel!
    @IBOutlet weak var productStatusText: UILabel!
    @IBOutlet weak var productsNumberInStock: UILabel!
    
    lazy var cosmosView: CosmosView = {

        var view = Cosmos.CosmosView()
        view.settings.updateOnTouch = false
        view.settings.fillMode = .precise
        view.settings.starSize = 18
        view.settings.starMargin = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: Layout elements
        
        self.oldPrice.attributedText = NSAttributedString(string: "999", attributes: [NSAttributedString.Key.strikethroughStyle:NSUnderlineStyle.single.rawValue])
        
        self.productDiscount.layer.masksToBounds = true
        self.productDiscount.layer.cornerRadius = 4
        
        self.productBasketBtn.layer.masksToBounds = true
        self.productBasketBtn.layer.cornerRadius = 4
        
        self.informationView.layer.masksToBounds = true
        self.informationView.layer.cornerRadius = 4
        
        // MARK: Nib register
        
        let nibCell = UINib(nibName: GalleryCollectionViewCell.identifier, bundle: nil)
        detailCollectionView.register(nibCell, forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
        
        // MARK: Slider
        
        sliderPageControl.currentPage = 0
        sliderPageControl.numberOfPages =  presenter.product?.images?.count ?? 0
        
        
        //MARK: Rating
        
        productTitleView.addSubview(cosmosView)
        NSLayoutConstraint.activate([
            cosmosView.leadingAnchor.constraint(equalTo: productTitleView.leadingAnchor, constant: 20),
            cosmosView.bottomAnchor.constraint(equalTo: productTitleView.bottomAnchor, constant: -21),
        ])
        
        presenter.setProduct()
        
    }

}

extension ProductDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return presenter.product?.images?.count ?? 0
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }

        let productItem = (presenter.product?.images?[indexPath.row])!
        
        
        // MARK: Обрезаем ссылку
        
        var str = productItem
        let range = (str.index(str.startIndex, offsetBy: 8))..<(str.index(str.startIndex, offsetBy: 17))
        str.removeSubrange(range)
        
        cell.galleryPhoto.sd_setImage(with: URL(string: str))
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        sliderPageControl.currentPage = indexPath.row

    }


}

extension ProductDetailViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: view.frame.size.width, height: 400)

   }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    }

}

extension ProductDetailViewController: ProductDetailViewProtocol {
    
    func setProduct(product: Product?) {
        
        let productItem = presenter.product
        
        
        productArticul.text = "Артикул: \(String(productItem?.articul ?? ""))"
        productDiscount.text = "\(String(productItem?.discount ?? 0)) %"
        productColor.text = "Цвет: \(String(productItem?.color ?? ""))"
        oldPrice.text = "\(String(productItem?.prices.old ?? 0)) ₽"
        currentPrice.text = "\(String(productItem?.prices.new ?? 0)) ₽"
        productBonuses.text = "+ \(String(productItem?.bonusesForbuy ?? 0)) бонусов"
        productTitle.text = productItem?.name
        productRating.text = String(productItem?.rating ?? 0)
        productNumberOfReviews.text = "\(String(productItem?.numberOfReviews ?? "")) отзывов"
        productStatusText.text = productItem?.statusText
        productsNumberInStock.text = "Количество на складе: \(String(productItem?.in_stock ?? 0)) шт."
        
    }
    
}

