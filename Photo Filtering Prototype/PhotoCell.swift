//
//  PhotoCell.swift
//  Photo Filtering Prototype
//
//  Created by Фёдор Королёв on 29.03.17.
//  Copyright © 2017 Фёдор Королёв. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var likes: UILabel!// ❤︎
    @IBOutlet var circles: UILabel! //⚫
    @IBOutlet var whiteBackground: UIView!
    @IBOutlet var ratingWidth: NSLayoutConstraint!
    @IBOutlet var stars: UILabel! //★
    
    var rating:PhotoRating = PhotoRating() {
        didSet {
            print(self.rating)
            self.likes.text   = Array<String>(repeating: "❤︎", count: self.rating.likes).joined(separator: "")
            self.likes.isHidden = self.rating.likes == 0
            
            self.circles.isHidden = self.rating.circles == 0
            self.circles.text = Array<String>(repeating:"⚫", count: self.rating.circles).joined(separator: "")
            
            self.stars.text   = Array<String>(repeating:"★",  count:self.rating.stars).joined(separator: "")
            self.stars.isHidden = self.rating.stars == 0
            
            self.stars.superview?.isHidden = !rating.hasAtLeastOnePoint
            
            self.whiteBackground.isHidden = self.stars.superview?.isHidden ?? true
//            self.ratingWidth.constant = ceil( (55.0 - 3.0) /  CGFloat( max(rating.maxPoints, 1) ) )
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewWithTag(777)?.layer.cornerRadius = 5
        self.viewWithTag(777)?.clipsToBounds = true
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
}
