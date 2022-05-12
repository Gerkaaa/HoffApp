//
//  ProductDetailPresenter.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 17.04.2022.
//

import Foundation

protocol ProductDetailViewProtocol: AnyObject {
    func setProduct(product: Product?)
}

protocol ProductDetailViewPresenterProtocol: AnyObject {

    init(view: ProductDetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, product: Product?)
    func setProduct()
    var product: Product? { get set }

}

class ProductDetailPresenter: ProductDetailViewPresenterProtocol {

    weak var view: ProductDetailViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol!
    var product: Product?


    required init(view: ProductDetailViewProtocol, networkService: NetworkServiceProtocol,router: RouterProtocol, product: Product?) {

        self.view = view
        self.router = router
        self.networkService = networkService
        self.product = product

    }

    public func setProduct() {

        self.view?.setProduct(product: product)

    }


}
