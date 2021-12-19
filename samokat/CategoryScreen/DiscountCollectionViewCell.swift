//
//  DiscountCollectionViewCell.swift
//  samokat
//
//  Created by ms28 on 19.12.21.
//

import UIKit

class DiscountCollectionViewCell: UICollectionViewCell {
    
    let cornerRadius: CGFloat = 8.0
    

    @IBOutlet weak var discountCellName: UILabel!
    
    @IBOutlet weak var discountCellImage: UIImageView!
    
    func configure(with cellName: String, with imageName: String) {
        discountCellName.text = cellName
        discountCellImage.image = UIImage(named: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
        
    }
        
}
