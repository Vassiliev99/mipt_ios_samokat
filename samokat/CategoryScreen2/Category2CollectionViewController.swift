//
//  Category2CollectionViewController.swift
//  samokat
//
//  Created by ms28 on 20.12.21.
//

import UIKit


class Category2CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    let dataMain = [
        [
            ["Discounts"],
            ["Cucumbers", "Tomatoes", "Apples"],
            ["breakfast", "new", "new"],
            ["100", "200", "300"],
            ["500", "500", "500"]
        ],
        [
            ["Tomatoes"],
            ["Tomatoes Ekokultura", "Tomatoes Cherry yellow"],
            ["new", "new"],
            ["209", "155"],
            ["350", "250"]
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Category"

        guard let category2CollectionView = collectionView, let flowLayout = category2CollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
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

        let noOfCellsInRow = 2
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: Int(Double(size) * 1.5))
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if (kind == UICollectionView.elementKindSectionHeader) {
            var header = UICollectionReusableView()
            
            if let categoryHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Category2Header", for: indexPath) as? HeaderCategory2CollectionReusableView {
                
                categoryHeader.configure(with: dataMain[indexPath.section][0][0])
                header = categoryHeader
            }
            return header
        }
            
        var footer = UICollectionReusableView()
        if let categoryFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Category2Footer", for: indexPath) as? FooterCategory2CollectionReusableView {
            
            footer = categoryFooter
        }
        return footer
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Category2Cell", for: indexPath) as? Ctaegory2CollectionViewCell {
            
            categoryCell.configure(with: dataMain[indexPath.section][1][indexPath.row], with: dataMain[indexPath.section][2][indexPath.row], with: dataMain[indexPath.section][4][indexPath.row], with: dataMain[indexPath.section][3][indexPath.row])
            cell = categoryCell
        }
        
        return cell
    }

}
