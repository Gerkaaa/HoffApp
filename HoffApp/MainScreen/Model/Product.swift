//
//  Product.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 13.04.2022.
//

import Foundation

struct ProductModel: Codable {
    let totalCount: Int
    var items: [Product]
}

struct Product: Codable {
    let id: String
    let name: String
    let image: String
    let prices: Prices
    let rating: Float?
    let numberOfReviews: String?
    let in_stock: Int?
    let statusText: String?
    let categoryId: String
    let categoryTitle: String
    let discount: Int?
    let images: [String]?
    let tag: [Tag]?
    let articul: String?
    let color: String?
    let bonusesForbuy: Int?
    let isFavorite: Bool?

}

struct Prices: Codable {
    let new: Int
    let old: Int
}

struct Tag: Codable {
    let text: String
    let textColor: String
    let bgColor: String
}
