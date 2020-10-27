//
//  shoesCollectionVCell.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/17/20.
//

import UIKit

class shoesCollectionVCell: UICollectionViewCell, UICollectionViewDelegate {
    
    var heartbtnTappedCounter = 0
   
     
    @IBOutlet weak var shoeCollectionView: UICollectionView!
    
    @IBOutlet weak var brandLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var lblToChangeBackGroundColor: UILabel!
    @IBOutlet  weak var heartBtn: UIButton!
    
    @IBAction func putYourShoeInTheCartTappingTheHeart (_ sender: Any?){
        
        
            if heartbtnTappedCounter == 0{
            heartBtn.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
                var index = shoeCollectionView.indexPath(for: self)
                let shoe = DataService.instance.getShoes()[index!.row]
                DataService.instance.cart.append(shoe)
                heartbtnTappedCounter += 1
            } else {
            heartBtn.setImage(UIImage.init(systemName: "heart"), for: .normal)
                var index = shoeCollectionView.indexPath(for: self)
                let shoe = DataService.instance.getShoes()[index!.row]
                if arrayElementCartCompariing(arrayElementOne: shoe, arrayElementTwo: DataService.instance.cart[index!.row]) {
                    DataService.instance.cart.removeLast()
                }
                heartbtnTappedCounter = 0
            }
            
        
        
     
        
            
    }
    
    
    
    
    func updateShoesView(forShoes: Shoes){
        brandLbl.text = forShoes.brend
        modelLbl.text = forShoes.model
        priceLbl.text = forShoes.price
        shoeImage.image = UIImage(named: forShoes.imageName)
        let color = getPixelColor(pos: CGPoint(x: 110,y: 750), inThis: shoeImage)
        lblToChangeBackGroundColor.backgroundColor = color
        
    }
    // i was trying to put in place somthing to get the background of the shoe proogrammatically and automatically !
    // i explore a little bit of Objective-C however i struggle to find a correct way to implent this

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

    
    
    func arrayElementCartCompariing (arrayElementOne: Shoes, arrayElementTwo: Shoes) -> Bool {
        if arrayElementOne.brend == arrayElementTwo.brend &&
           arrayElementOne.description == arrayElementTwo.description &&
           arrayElementOne.imageName == arrayElementTwo.imageName &&
           arrayElementOne.model == arrayElementTwo.model &&
           arrayElementOne.price == arrayElementTwo.price &&
            arrayElementOne.size == arrayElementTwo.size {
            return true
        } else {
            return false
        }
    }

    }

