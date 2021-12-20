//
//  ItemCollectionViewCell.swift
//  samokat
//
//  Created by ms28 on 19.12.21.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    let cornerRadius: CGFloat = 8.0
    

    @IBOutlet weak var itemCellName: UILabel!
    
    @IBOutlet weak var itemImageName: UIImageView!
    
    func configure(with cellName: String, with imageName: String) {
        itemCellName.text = cellName
        itemImageName.image = UIImage(named: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
        
    }
}
