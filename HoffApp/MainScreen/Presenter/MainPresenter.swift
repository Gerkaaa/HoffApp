//
//  MainPresenter.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 13.04.2022.
//

import Foundation
import UIKit
import SwiftEntryKit

protocol MainViewProtocol: AnyObject {
    
    func succes()
    func failure(error: Error)
    
}

protocol MainViewPresenterProtocol: AnyObject {
    
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getProducts()
    func downloadMoreItems(collectionView: UICollectionView, count: Int)
    func tapOnTheProduct(product: Product?, indexVC: Int)
    func viewIsReady()
    func setupAttributes() -> EKAttributes
    var products: ProductModel? { get set }
    var product: Product? { get set }
}

class MainPresenter: MainViewPresenterProtocol {

    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    var products: ProductModel?
    var product: Product?
    let networkService: NetworkServiceProtocol!
    var currrentNumberOfItems: Int = 0
    
    var categoryId = "320"
    var sortBy = "popular"
    var sortType = "desc"
    var limit = "20"
    var offset = "0"
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        
        self.view = view
        self.router = router
        self.networkService = networkService
    }
    
    func getProducts() {
        networkService.getProducts(limit: limit, sortBy: sortBy, sortType: sortType, categoryId: categoryId, offset: offset) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    if self.products == nil {
                        self.products = products

                    } else {
                        self.products?.items += products?.items ?? []
                    }
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func downloadMoreItems(collectionView: UICollectionView, count: Int) {
        
        currrentNumberOfItems += count + 1
        
        getProducts()
    }
    
    func tapOnTheProduct(product: Product?, indexVC: Int) {
        router?.setProduct(product: product, indexVC: indexVC)
    }
    
    func viewIsReady() {
        getProducts()
    }
    //MARK: PopUp
    
    func setupAttributes() -> EKAttributes {

        var attributes = EKAttributes.bottomToast

        attributes.displayDuration = .infinity
        attributes.screenBackground = .color(color: .init(light: UIColor(white: 100.0/255.0, alpha: 0.3),  dark: UIColor(white: 50.0/255.0, alpha: 0.3)))
        attributes.shadow = .active(
            with: .init(
                color: .black,
                opacity: 0.3,
                radius: 8
            )
        )
        
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.scroll = .enabled(
            swipeable: true,
            pullbackAnimation: .jolt
        )

        attributes.entranceAnimation = .init(
            translate: .init(
                duration: 0.7,
                spring: .init(damping: 1, initialVelocity: 0)
            ),
            scale: .init(
                from: 1.05,
                to: 1,
                duration: 0.4,
                spring: .init(damping: 1, initialVelocity: 0)
            )
        )

//            fade: attributes.exitAnimation = .init(
//            translate: .init(duration: 0.2)
//        )
        
        return attributes

    }
    
    
}
