//
//  ProductModel.swift
//  Lampa
//
//  Created by George Kyrylenko on 14.03.2018.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import Foundation

struct Products: Codable{
    let next: String?
    let previous: String?
    let results: [ProductData]?
}

struct ProductData: Codable{
    let id: Int?
    let name: String?
    let image: ImageProduct?
    let price: Int?
    let price_week: Int?
    let price_month: Int?
    let currency: Currency?
    let view_count: Int?
    let favorite: Bool?
    let email_count: Int?
    let phone_count: Int?
    let owner: Bool?
    let category: Int?
}

struct ImageProduct: Codable{
    let url: String?
    let width: Int?
    let height: Int?
}

struct Currency: Codable{
    let id: Int?
    let name: String?
    let image: String?
}

