//
//  MainTableViewDelegate.swift
//  Lampa
//
//  Created by George Kyrylenko on 14.03.2018.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension MainController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            return topCell
        }
        let cell = self.productsTable.dequeueReusableCell(withIdentifier: "productCell") as! ProductCell
        let product = self.products[indexPath.row - 1]
        cell.lblPrice.text = "Цена \(product.price!)"
        cell.lblViewCount.text = "Просмотров \(product.view_count!)"
        cell.titleProduct.text = product.name
        if product.image?.url != nil{
        let url = URL(string: (product.image?.url! ?? "error")!)
        if url != nil{
            cell.imageHeigth.constant = CGFloat((product.image?.height)!)*(cell.imageProduct.frame.size.width/CGFloat((product.image?.width)!))
            cell.imageProduct.kf.setImage(with: url!)
        }
        }else{
             cell.imageProduct.image = #imageLiteral(resourceName: "default")
             cell.imageHeigth.constant = cell.imageProduct.frame.size.width
        }
        DispatchQueue.global(qos: .default).async {
            if product.image?.url != nil{
                let url = URL(string: (product.image?.url! ?? "error")!)
                if url != nil{
                    cell.imageProduct.kf.setImage(with: url!)
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == products.count - 1 && isLoad && nextUrl != nil{
            Network.loadProductsByUrl(url: nextUrl!, method: { (product, error) in
                self.loadProducts(products: product!)
                self.isLoad = false
        })
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= scrollView.frame.size.height{
            UIView.animate(withDuration: 0.3, animations: {
                self.btnUp.alpha = 1
            })
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.btnUp.alpha = 0
            })
        }
    }
}
