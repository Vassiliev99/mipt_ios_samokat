//
//  Ctaegory2CollectionViewCell.swift
//  samokat
//
//  Created by ms28 on 20.12.21.
//

import UIKit

class Ctaegory2CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var item2AddToCart: UIButton!
    @IBOutlet weak var item2Weight: UILabel!
    @IBOutlet weak var item2Name: UILabel!
    @IBOutlet weak var item2Image: UIImageView!
    
    var item2ImageName: String = ""
    var item2PriceValue: String = ""
    var item2WeightValue: String = ""
    
    let cornerRadius: CGFloat = 8.0
    
    func configure(with cellName: String, with imageName: String, with weight: String, with price: String) {
        item2Name.text = cellName
        item2Image.image = UIImage(named: imageName)
        item2ImageName = imageName
        item2Weight.text = weight + "g."
        item2AddToCart.setTitle(price + "P +", for: .normal)
        item2PriceValue = price
        item2WeightValue = weight
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
        
    }}
