//
//  RouterProtocol.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 23.04.2022.
//

import UIKit


protocol RouterMain {
    
    var navigationController: [UINavigationController]! { get set }
    var assemblyBuilder: AssemblyBuilder? { get set }
    
}


protocol RouterProtocol: RouterMain {
    
    func initialViewController() -> UIViewController
    func setProduct(product: Product?, indexVC: Int)
    func mainViewController() -> UIViewController
    func basketViewController() -> UIViewController
    func favoriteViewController() -> UIViewController
    func profileViewController() -> UIViewController
    
}


class Router: RouterProtocol {
    
    var navigationController: [UINavigationController]!
    var assemblyBuilder: AssemblyBuilder?
    
    init(navigationController: [UINavigationController]!, assemblyBuilder: AssemblyBuilder) {
        
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
        
    }
    
    func initialViewController() -> UIViewController {
        
        guard let homeViewController = assemblyBuilder?.createHomeModule(router: self) else { return UIViewController() }
        
        return homeViewController
        
    }
    
    func basketViewController() -> UIViewController {
        
        guard let basketViewController = assemblyBuilder?.createBasketModule(router: self) else { return UIViewController() }
        
        return basketViewController
        
    }
    
    func profileViewController() -> UIViewController {
        
        guard let profileViewController = assemblyBuilder?.createProfileModule(router: self) else { return UIViewController() }
        
        return profileViewController
        
    }
    
    func mainViewController() -> UIViewController {
        
        guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else { return UIViewController() }
        
        return mainViewController
        
    }
    
    func favoriteViewController() -> UIViewController {
        
        guard let favoriteViewController = assemblyBuilder?.createFavoriteModule(router: self) else { return UIViewController() }
        
        return favoriteViewController
        
    }
    
    func setProduct(product: Product?, indexVC: Int) {

            guard let detailViewController = assemblyBuilder?.createDetailModule(product: product, router: self) else { return }
            navigationController[indexVC].pushViewController(detailViewController, animated: true)

    }
    
    
    
}
