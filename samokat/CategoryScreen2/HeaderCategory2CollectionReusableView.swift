//
//  HeaderCategory2CollectionReusableView.swift
//  samokat
//
//  Created by ms28 on 20.12.21.
//

import UIKit

class HeaderCategory2CollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var subcategory2Name: UILabel!
    
    func configure(with header: String) {
        subcategory2Name.text = header
    }
}
