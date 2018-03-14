//
//  Links.swift
//  Lampa
//
//  Created by George Kyrylenko on 14.03.2018.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import Foundation

class GetLink{
       static let base = "http://allcom.lampawork.com/api/v1.0"
    static func products() -> URL{
        let url = URL(string: "\(base)/products/")
        return url!
    }
}
