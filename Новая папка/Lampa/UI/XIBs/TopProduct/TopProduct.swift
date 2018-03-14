//
//  TopProduct.swift
//  Lampa
//
//  Created by George Kyrylenko on 14.03.2018.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import UIKit

class TopProduct: UIView {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var viewCount: UILabel!
    @IBOutlet var topView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
    }

    public func loadViewFromNib(){
        UINib(nibName: "TopProduct", bundle: nil).instantiate(withOwner: self, options: nil)
        topView.frame.size.width = self.frame.width
        self.addSubview(topView)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
