//
//  CategoryViewController.swift
//  samokat
//
//  Created by ms28 on 19.12.21.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var discountsCollectionView: UICollectionView!
    
    let dataDiscounts = ["1", "2", "3", "4", "5", "6"]
    
    let dataItems = ["1", "2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Category"

        self.discountsCollectionView.dataSource = self
        self.discountsCollectionView.delegate = self
    }
    

}

extension CategoryViewController:UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == discountsCollectionView) {
            return dataDiscounts.count
        }
        return dataItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if (collectionView == discountsCollectionView) {
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
