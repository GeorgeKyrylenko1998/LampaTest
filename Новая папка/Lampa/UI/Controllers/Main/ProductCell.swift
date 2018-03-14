//
//  ProductCell.swift
//  Lampa
//
//  Created by George Kyrylenko on 14.03.2018.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblViewCount: UILabel!
    @IBOutlet weak var imageHeigth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
