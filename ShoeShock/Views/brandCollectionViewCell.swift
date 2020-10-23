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
    
    @IBAction func selectingTheShoesBrand(_sender: Any?){
//        let shoeToShow = DataService.instance.getShoes(byBrand: brandButton)
//        if brandButton.isTouchInside == true {
//            brandButton.isHighlighted = true
            
        }
    }

    

