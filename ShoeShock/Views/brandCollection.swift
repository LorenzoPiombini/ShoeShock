//
//  brandCollection.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/16/20.
//

import UIKit

class brandCollection: UICollectionView {
    @IBOutlet weak var brandButton: UIButton!
    
    func updateBrandViews(shoes: Shoes){
        brandButton.titleLabel?.text = shoes.brend
        
    }
    


}
