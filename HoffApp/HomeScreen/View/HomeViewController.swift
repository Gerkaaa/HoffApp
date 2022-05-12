//
//  HomeViewController.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 23.04.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
//    @IBOutlet weak var bannerView: BannerView!
    
//    @IBOutlet weak var forBuyingCV: UICollectionView!
    @IBOutlet weak var mainGalleryCV: UICollectionView! 
    
    @IBOutlet weak var stockAddionalList: UIView!
    @IBOutlet weak var bonusesAddionalList: UIView!
    @IBOutlet weak var bestPriceAddionalList: UIView!
    @IBOutlet weak var shopsAddionalList: UIView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let galleryArray = ["img3","img2","img1","img4"]
    let galleryArray1 = ["img1","img2","img3","img4"]
    let mainGalleryCellId = "MainGalleryCollectionViewCell"
    let cardCellId = "cell2"
    
    
    var timer: Timer?
    var currentImageIndex = 0
    var currentPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldSetup()
        customAdditionalList()
        
        // MARK: - Nib register
        
//        bannerView.configure()
//        secondView.configure()
//
        let nibCell = UINib(nibName: mainGalleryCellId, bundle: nil)
        mainGalleryCV.register(nibCell, forCellWithReuseIdentifier: mainGalleryCellId)
        
//        forBuyingCV.register(UINib(nibName: "ForBuyingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cardCellId)
        
        // MARK: Slider
        
        pageControl.currentPage = 0
        pageControl.numberOfPages =  galleryArray.count
        
        // MARK: - Gallery timer
        
//        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(nextSlide), userInfo: nil, repeats: true)
//
        
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        if (collectionView == forBuyingCV) {
//
//            return 10
//
//        }
//
//        return galleryArray.count
//
//    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = mainGalleryCV.dequeueReusableCell(withReuseIdentifier: MainGalleryCollectionViewCell.identifier, for: indexPath) as? MainGalleryCollectionViewCell else { return UICollectionViewCell() }
//
//           cell.galleryImage.image = UIImage(named: galleryArray[indexPath.row])
//
//        if (collectionView == forBuyingCV) {
//
//            guard let cell2 = forBuyingCV.dequeueReusableCell(withReuseIdentifier: cardCellId, for: indexPath) as? ForBuyingCollectionViewCell else { return UICollectionViewCell() }
//
//
//            return cell2
//        }
//
//           return cell
//
//    }
    
    // MARK: - Auto layout
    
//    @objc func nextSlide() {
//
//        if currentImageIndex < galleryArray.count - 1 {
//
//            currentImageIndex = currentImageIndex + 1
//
//        } else {
//
//            currentImageIndex = 0
//
//        }
//
//        mainGalleryCV.scrollToItem(at: IndexPath(item: currentImageIndex, section: 0), at: .right, animated: true)
//
//    }
//
    func textFieldSetup() {
        
        let imageView = UIImageView(frame: CGRect(
            x: 12,
            y: 12,
            width: 20,
            height: 20))
        
        let image = UIImage(systemName: "magnifyingglass")?.sd_tintedImage(with: .gray)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        
        let searchTextFieldView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: 30,
            height: 44))
        
        searchTextFieldView.addSubview(imageView)
        searchTextFieldView.backgroundColor = .clear
        
        searchField.leftViewMode = UITextField.ViewMode.always
        searchField.leftView = searchTextFieldView
        
        searchField.layer.shadowRadius = 5
        searchField.layer.shadowOpacity = 0.2
        searchField.layer.shadowOffset = CGSize.zero
        
    }
    
    func customAdditionalList() {

        stockAddionalList.layer.masksToBounds = true
        stockAddionalList.layer.cornerRadius = 28
        bonusesAddionalList.layer.masksToBounds = true
        bonusesAddionalList.layer.cornerRadius = 28
        
        bestPriceAddionalList.layer.masksToBounds = true
        bestPriceAddionalList.layer.cornerRadius = 28
        
        shopsAddionalList.layer.masksToBounds = true
        shopsAddionalList.layer.cornerRadius = 28
        
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return galleryArray.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainGalleryCellId, for: indexPath) as? MainGalleryCollectionViewCell else { return UICollectionViewCell() }

        cell.galleryImage.image = UIImage(named: galleryArray[indexPath.row])

        return cell

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: view.frame.size.width, height: 320)
   }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        pageControl.currentPage = indexPath.row

    }

}



//class BannerView: UIView {
//
//    func configure() {
//
//    }
//}
