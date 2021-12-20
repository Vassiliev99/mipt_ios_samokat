//
//  CategoryViewController.swift
//  samokat
//
//  Created by ms28 on 19.12.21.
//

import UIKit

class CategoryViewController: UIViewController {
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    @IBOutlet weak var discountsCollectionView: UICollectionView!
    
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    let dataDiscounts = ["1", "2", "3", "4", "5", "6"]
    
    
    let dataItems = [
        [
            ["Main"],
            ["New", "Breakfast", "New Year", "International", "Cashier"],
            ["new", "breakfast", "newyear", "international", "cashier"]
        ],
        [
            ["By Samokat"],
            ["Food", "Beverages", "Sweets & Snacks", "Cleaning"],
            ["food", "beverages", "sweetssnacks", "cleaning"],
        ],
        [
            ["Almost ready"],
            ["Ready-to-eat", "Unfreeze", "Cook quickly"],
            ["readytoeat", "unfreeze", "cookquick"]
        ],
        [
            ["Milk, eggs, cheese"],
            ["Milk & Eggs", "Yogurts & Desserts", "Cheese"],
            ["milk", "yogurt", "cheese"]
        ],
        [
            ["Bread & Pastry"],
            ["Bread", "Pastry", "Breadcrumbs"],
            ["bread", "pastry", "breadcrumbs"]
        ],
        [
            ["Fruits & Vegetables"],
            ["Season now", "Vegetables", "Fruits & Berries"],
            ["season", "vegetables", "fruits"],
        ],
        [
            ["Meat & Fish"],
            ["Meat", "Chicken", "Sausages", "Fish & Seafood"],
            ["meat", "chicken", "sausage", "fish"],
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Category"

        self.discountsCollectionView.dataSource = self
        self.discountsCollectionView.delegate = self
        
        self.itemsCollectionView.dataSource = self
        self.itemsCollectionView.delegate = self
    }
    

}

extension CategoryViewController:UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (collectionView == discountsCollectionView) {
            return 1
        }
        return dataItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == discountsCollectionView) {
            return dataDiscounts.count
        }
        return dataItems[section][1].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ItemCollectionViewCell {
            
            itemCell.configure(with: "Item name", with: "new")
            cell = itemCell
        }
        if (collectionView == self.discountsCollectionView) {
            if let discountCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscountCell", for: indexPath) as? DiscountCollectionViewCell {
                
                discountCell.configure(with: "Item name", with: "breakfast")
                cell = discountCell
            }
        }

        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 3.5
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: Int(Double(size) / 1.5))
    }
    
    
    
    
}
