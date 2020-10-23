//
//  shoesCollectionVCell.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/17/20.
//

import UIKit

class shoesCollectionVCell: UICollectionViewCell, UICollectionViewDelegate {
    
    
    
    
    @IBOutlet weak var brandLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var lblToChangeBackGroundColor: UILabel!
    
    func updateShoesView(forShoes: Shoes){
        brandLbl.text = forShoes.brend
        modelLbl.text = forShoes.model
        priceLbl.text = forShoes.price
        shoeImage.image = UIImage(named: forShoes.imageName)
        let color = getPixelColor(pos: CGPoint(x: 110,y: 750), inThis: shoeImage)
        lblToChangeBackGroundColor.backgroundColor = color
        
    }
    
    func getPixelColor(pos: CGPoint, inThis: UIImageView ) -> UIColor{
        let pixeldata = inThis.image?.cgImage!.dataProvider!.data
        let data: UnsafePointer = CFDataGetBytePtr(pixeldata)
        
        let pixelInfo = Int((inThis.image?.size.width)!) * Int(pos.y) + Int(pos.x) * 3
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo] + 1) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo] + 2) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo] + 3) / CGFloat(255.0)
         return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
   
    
    
}