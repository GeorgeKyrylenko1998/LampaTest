//
//  TopProductCell.swift
//  Lampa
//
//  Created by George Kyrylenko on 14.03.2018.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import UIKit

class TopProductCell: UITableViewCell, UIScrollViewDelegate{

    @IBOutlet weak var topScroll: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int((scrollView.contentOffset.x + scrollView.frame.width/2)/scrollView.frame.size.width)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
