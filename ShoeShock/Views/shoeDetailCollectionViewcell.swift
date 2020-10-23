//
//  shoeDetailCollectionViewcell.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/20/20.
//

import UIKit

class shoeDetailCollectionViewcell: UICollectionViewCell {
    @IBOutlet weak var shoeImage:UIImageView!
    @IBOutlet weak var modelLbl:UILabel!
    @IBOutlet weak var priceLbl:UILabel!
    @IBOutlet weak var descriptionLbl:UILabel!
    
    func updateShoeDetailView(shoe: Shoes){
        shoeImage.image = UIImage(named: shoe.imageName)
        modelLbl.text = shoe.model
        priceLbl.text = shoe.price
        descriptionLbl.text = shoe.description
        
        
    }
}
