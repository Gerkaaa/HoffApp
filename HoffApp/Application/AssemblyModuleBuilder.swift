//
//  ModuleBuilder.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 13.04.2022.
//

import UIKit

protocol AssemblyBuilder {
    
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(product: Product?, router: RouterProtocol) -> UIViewController
    func createHomeModule(router: RouterProtocol) -> UIViewController
    func createBasketModule(router: RouterProtocol) -> UIViewController
    func createFavoriteModule(router: RouterProtocol) -> UIViewController
    func createProfileModule(router: RouterProtocol) -> UIViewController
    
}

class AssemblyModuleBuilder: AssemblyBuilder {
    
    
    func createMainModule(router: RouterProtocol) -> UIViewController {
        
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        view.presenter = presenter
        return view
        
    }
    
    func createFavoriteModule(router: RouterProtocol) -> UIViewController {
        
        let view = FavoriteViewController()
        
        return view
        
    }
    
    func createHomeModule(router: RouterProtocol) -> UIViewController {
        
        let view = HomeViewController()
        
        return view
        
    }
    
    func createBasketModule(router: RouterProtocol) -> UIViewController {
        
        let view = BasketViewController()
        
        return view
        
    }
    
    func createProfileModule(router: RouterProtocol) -> UIViewController {
        
        let view = ProfileViewController()
        
        return view
        
    }
    
    func createDetailModule(product: Product?, router: RouterProtocol) -> UIViewController {
        
        let view = ProductDetailViewController()
        let networkService = NetworkService()
        let presenter = ProductDetailPresenter(view: view, networkService: networkService, router: router, product: product)
        
        view.presenter = presenter
        
        return view
        
    }
    
}
