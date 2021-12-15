//
//  CollectionViewController.swift
//  samokat
//
//  Created by ms28 on 14.12.21.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let dataSource: [String] = ["Whats new", "Breakfast", "New Year", "International", "Cashier"]
    
    let dataMain = [
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
        
        guard let collectionView = collectionView, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }

        let margin: CGFloat = 10
        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = margin
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataMain.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataMain[section][1].count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 3
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: Int(Double(size) * 1.3))
    }

    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if (kind == UICollectionView.elementKindSectionHeader) {
            var header = UICollectionReusableView()
            
            if let categoryHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? HeaderCollectionReusableView {
                
                categoryHeader.configure(with: dataMain[indexPath.section][0][0])
                header = categoryHeader
            }
            return header
        }
            
        var footer = UICollectionReusableView()
        if let categoryFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath) as? FooterCollectionReusableView {
            
            footer = categoryFooter
        }
        return footer
        
    }
        
        
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            categoryCell.configure(with: dataMain[indexPath.section][1][indexPath.row], with: dataMain[indexPath.section][2][indexPath.row])
            cell = categoryCell
        }
        
        return cell
    }
    
    
}
