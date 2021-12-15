//
//  CollectionViewCell.swift
//  samokat
//
//  Created by ms28 on 14.12.21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    let cornerRadius: CGFloat = 8.0
    
    @IBOutlet private weak var cellNameLabel: UILabel!
    
    func configure(with cellName: String) {
        cellNameLabel.text = cellName
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = cornerRadius
        layer.cornerRadius = cornerRadius
        
    }
}
