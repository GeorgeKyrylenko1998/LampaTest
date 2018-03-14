//
//  Network.swift
//  Lampa
//
//  Created by George Kyrylenko on 14.03.2018.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import Foundation

class Network{
    static func loadProducts(method: @escaping (_ products: Products?, _ error: Error?) -> Void){
        let request = NSMutableURLRequest(url: GetLink.products())
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
                let _products = try? JSONDecoder().decode(Products.self, from: data!)
                method(_products, error)
        }.resume()
    }
    
    static func loadProductsByUrl(url: String, method: @escaping (_ products: Products?, _ error: Error?) -> Void){
        let request = NSMutableURLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            let _products = try? JSONDecoder().decode(Products.self, from: data!)
            method(_products, error)
            }.resume()
    }
}
