//
//  TestViewController.swift
//  samokat
//
//  Created by ms28 on 19.12.21.
//

import UIKit

class TestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? Test2CollectionViewCell {
            
            categoryCell.backgroundColor = UIColor.blue
            cell = categoryCell
        }
        if (collectionView == cview1) {
            if let categoryCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as? Test1CollectionViewCell {
                
                categoryCell2.backgroundColor = UIColor.red
                cell = categoryCell2
            }
            
        }
        
        return cell
        
    }
    

    @IBOutlet weak var cview2: UICollectionView!
    @IBOutlet weak var cview1: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == cview1) {
            return 10
        }
        return 5
    }
    

}
