//
//  HeaderCollectionReusableView.swift
//  samokat
//
//  Created by ms28 on 15.12.21.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var headerLabel: UILabel!
    
    func configure(with header: String) {
        headerLabel.text = header
    }
}
