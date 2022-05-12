//
//  NetworkService.swift
//  HoffApp
//
//  Created by Герекмаз Газимагомедова on 15.04.2022.
//

import Alamofire

protocol NetworkServiceProtocol {
    
    func getProducts(limit: String, sortBy: String, sortType: String, categoryId: String, offset: String , completion: @escaping (Result<ProductModel?, Error>) -> Void)
    
}

class NetworkService: NetworkServiceProtocol {
    
    
    let urlDomain = "https://dev-re-1.hoff.ru/api/v2/get_products_new"
    let urlCategory = "?category_id="
    let urlSortBy = "&sort_by="
    let urlSortType = "&sort_type="
    let urlLimit = "&limit="
    let urlOffset = "&offset="
    let urlDeviceID = "&device_id=3a7612bcc84813b5"
    let urlIsAdroid = "&isAndroid=true"
    let urlAppVersion = "&app_version=1.8.16"
    let urlLocation = "&location=19"
    
    func getProducts( limit: String, sortBy: String, sortType: String, categoryId: String, offset: String ,completion: @escaping (Result<ProductModel?, Error>) -> Void) {
        
        let url = urlDomain + urlCategory + categoryId + urlSortBy + sortBy + urlSortType + sortType + urlLimit + limit + urlOffset + offset + urlDeviceID
        
//        let url = "https://dev-re-1.hoff.ru/api/v2/get_products_new?category_id=320&sort_by=popular&sort_type=desc&limit=40&offset=0&device_id=3a7612bcc84813b5&isAndroid=true&app_version=1.8.16&location=19&xhoff=36f40b3d665cdb9435904796172dde5e3f13aa8a%3A4630"
        
        AF.request(url).responseDecodable(of: ProductModel.self) { (response) in
            completion(.success(response.value))
        }
    }
}
