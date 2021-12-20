//
//  ItemScreenViewController.swift
//  samokat
//
//  Created by ms28 on 20.12.21.
//

import UIKit

class ItemScreenViewController: UIViewController {
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemAddToCart: UIButton!
    
    @IBOutlet weak var itemWeight: UILabel!
    
    var itemNameValue: String = ""
    var itemImageValue: String = ""
    var itemPriceValue: String = ""
    var itemWeightValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemName.text = itemNameValue
        itemImage.image = UIImage(named: itemImageValue)
        itemAddToCart.setTitle(itemPriceValue + "P +", for: .normal)
        itemWeight.text = itemWeightValue + "g."
    }
    

}
