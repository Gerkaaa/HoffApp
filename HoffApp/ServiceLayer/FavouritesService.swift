//
//  FavouritesService.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 22.04.2022.
//

import Foundation

class Favourite {
    
    static let shared = Favourite()
    
    private var productsList: [Product] = []
    private var key = "Products"
    private var defaults = UserDefaults.standard
    
    
    private init() {
        
        guard let data = defaults.data(forKey: key),
            let getData = try? JSONDecoder().decode([Product].self, from: data) else { return }
        
        productsList.append(contentsOf: getData)
        
    }
 
    func isFavorite(productItem: Product?) -> Bool {
        
        if let _ = productsList.firstIndex(where: { $0.id == productItem?.id}) {
            
            return true
            
        } else {
            
            return false
            
        }
        
    }
    
    func checkFavoriteOnClick(productItem: Product) -> Bool {
        
        if let index = productsList.firstIndex(where: { $0.id == productItem.id}) {
            productsList.remove(at: index)
            
            synchronize()
            
            return false
            
        } else {
            
            productsList.append(productItem)
            synchronize()
            
            return true
            
        }
    }
    
    func clear() {
        
        productsList.removeAll()
        synchronize()
        
    }
    
    private func synchronize() {
        
        guard let products = try? JSONEncoder().encode(productsList) else { return }
        defaults.set(products, forKey: key)
        
    }
    
}


