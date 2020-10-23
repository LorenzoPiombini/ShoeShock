//
//  brandCollectionViewCell.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/16/20.
//

import UIKit

class brandCollectionViewCell: UICollectionViewCell {
 
    
    @IBOutlet weak var brandButton: UIButton!
    
    
    func updateViews(shoes: Shoes){
        brandButton.setTitle("\(shoes.brend)", for: .normal)
       
    }
    
   
    @IBAction func selectingTheShoesBrand(_ sender: Any?){
        
        // i have to figure it out
        brandButton.isHighlighted = true
        BrandButton.awakeFromNib()
        
        }
    }

    

