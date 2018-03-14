//
//  ViewController.swift
//  Lampa
//
//  Created by George Kyrylenko on 14.03.2018.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    var products = [ProductData]()
    var topProducts  = [ProductData]()
    var topCell = TopProductCell()
    var nextUrl: String?
    var isLoad = true
    @IBOutlet weak var btnUp: UIButton!
    @IBOutlet weak var productsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topCell = productsTable.dequeueReusableCell(withIdentifier: "topCell") as! TopProductCell
        self.title = "Продукты"
        Network.loadProducts { (product, error) in
            if error == nil{
                self.loadProducts(products: product!)
            } else {
                let alert = UIAlertController(title: "Проблема с загрузкой данных", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func upPress(_ sender: UIButton) {
        let indexPath = IndexPath(row: 0, section: 0)
        self.productsTable.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    func loadProducts(products: Products){
        nextUrl = products.next
        DispatchQueue.main.async {
            for product in products.results!{
                self.products.append(product)
                if product.view_count ?? 0 >= 50{
                    self.topProducts.append(product)
                    self.addTopitem(product: product)
                }
            }
            self.productsTable.reloadData()
            self.isLoad = true
        }
    }
    func addTopitem(product: ProductData){
        let view = TopProduct(frame: topCell.topScroll.frame)
        view.title.text = product.name!
        view.viewCount.text = "Просмотров \(product.view_count!)"
        view.price.text = "Цена \(product.price!)"
        view.frame.origin.x = CGFloat(self.topProducts.count - 1) * topCell.topScroll.frame.size.width
        topCell.topScroll.contentSize.width += topCell.topScroll.frame.size.width
        if let url = product.image?.url{
            view.image.kf.setImage(with: URL(string: url))
        }
        topCell.pageControl.numberOfPages = self.topProducts.count
        topCell.topScroll.addSubview(view)
    }
}

