//
//  ViewController.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 13.04.2022.
//

import UIKit
import SDWebImage
import SwiftEntryKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var paginationActivityIndicator: UIActivityIndicatorView!
    
    var presenter: MainViewPresenterProtocol!
    let currentIndex = 0
    let productCVCellId = "CardCell"
    let spinningCircleView = SpinningCircleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        //MARK: register cell
        
        let nibCell = UINib(nibName: productCVCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: productCVCellId)
        
        
        paginationActivityIndicator.isHidden = true
        configureSpinningCircleView()
        presenter.viewIsReady()
    }

    @IBAction func sortredButton(_ sender: Any) {
        
//        SwiftEntryKit.display(entry: SortedPopUpView(), using: presenter.setupAttributes())
        
    }
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return presenter.products?.items.count ?? 0
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCVCellId, for: indexPath) as? CardCell else { return UICollectionViewCell() }
        let productItem = (presenter.products?.items[indexPath.row])!

//        var str = productItem
//
//        let range = (str.index(str.startIndex, offsetBy: 8))..<(str.index(str.startIndex, offsetBy: 17))
//        str.removeSubrange(range)
//
//        cell.productGalleryImage.sd_setImage(with: URL(string: str))
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 4
        
        cell.configure(product: productItem, cell: cell)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let productItem = presenter.products?.items
        
        if indexPath.row == (productItem?.count ?? 0) - 1 {
            presenter.downloadMoreItems(collectionView: collectionView, count: indexPath.row)
            paginationActivityIndicator.startAnimating()
            paginationActivityIndicator.isHidden = false
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let product = presenter.products?.items[indexPath.row]
        
        presenter.tapOnTheProduct(product: product, indexVC: currentIndex)
        
    }
    
    // MARK: Custom activity indicator
    
    public func configureSpinningCircleView() {
        
        spinningCircleView.frame = CGRect(x: view.center.x - 40, y: view.center.y, width: 50, height: 50)
        view.addSubview(spinningCircleView)
        spinningCircleView.animate()
        
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: (view.frame.size.width / 2) - 15, height: 320)

   }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)

    }

}


extension MainViewController: MainViewProtocol {
    
    func succes() {
        
        collectionView.reloadData()
        spinningCircleView.isHidden = true
        paginationActivityIndicator.stopAnimating()
        paginationActivityIndicator.isHidden = true
        
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
}


