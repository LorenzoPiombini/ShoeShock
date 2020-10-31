//
//  shoesCollectionVCell.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/17/20.
//

import UIKit

class shoesCollectionVCell: UICollectionViewCell, UICollectionViewDelegate {
    
    // variable used to select and deselect, the Heart btn
    var heartbtnTappedCounter = 0
   
     
    @IBOutlet weak var shoeCollectionView: UICollectionView!
    
    @IBOutlet weak var brandLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var lblToChangeBackGroundColor: UILabel!
    @IBOutlet  weak var heartBtn: UIButton!
    
    @IBAction func putYourShoeInTheCartTappingTheHeart (_ sender: Any?){
        
        // heart btn code if you press the btn you put the item in the cart if you deselect the btn the item will be deleted
       
        let point = shoeImage.convert(CGPoint.zero, to: shoeCollectionView)
        guard let indexPath = shoeCollectionView.indexPathForItem(at: point) else {
         return
    }
        let shoe = DataService.instance.getShoes()[indexPath.row]
        
            if heartbtnTappedCounter == 0{
             DataService.instance.cart.append(shoe)
            heartBtn.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
                heartbtnTappedCounter += 1
            } else {
            heartBtn.setImage(UIImage.init(systemName: "heart"), for: .normal)
                if DataService.instance.cart.count != 0{
                    heartbtnTappedCounter = 0
                    for i in DataService.instance.cart {
                        DataService.instance.cart =  arrayElementCartCompariing(arrayElementOne: shoe, arrayElementTwo: DataService.instance.cart)
                        
                        }
                    } else {
                    heartbtnTappedCounter = 0
                    }
            }
    
            
    }
        
    
    
    
    
//   below I tryed to put a bedge on the cart item, without succes
    
    
    
//    func showingItemQuantityOnCartBarItem (onThisElement: UIBarButtonItem) {
//        let lblBadge = UILabel.init(frame:CGRect(x: 20, y: 0, width: 15, height: 15))
//        lblBadge.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
//        lblBadge.clipsToBounds = true
//        lblBadge.layer.cornerRadius = 7
//        lblBadge.textColor = UIColor.white
//        lblBadge.font = UIFont(name: "Futura", size: 10)
//        lblBadge.textAlignment = .center
//        lblBadge.text = "\(DataService.instance.cart.count)"
//
//        onThisElement.view(lblBadge)
//    }
            
    
    
    
    
    
    func updateShoesView(forShoes: Shoes){
        brandLbl.text = forShoes.brend
        modelLbl.text = forShoes.model
        priceLbl.text = "$ \(forShoes.price)"
        shoeImage.image = UIImage(named: forShoes.imageName)
        
//        let point: CGPoint = .init(x: shoeImage.image!.size.width/2, y: shoeImage.image!.size.height/2)
//
//      lblToChangeBackGroundColor.backgroundColor = getPixelColor(pos: point, inThis: shoeImage)
        
        
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

    // the follwing function is for determinate wheater the array instance is equal at the one in the cart, if so , the function will delete it cause this method will be called when the user deselected the heart btn, see uper along this swift file
    
    
    func arrayElementCartCompariing (arrayElementOne: Shoes, arrayElementTwo: [Shoes]) -> [Shoes] {
        var index = 0
        var newArray = arrayElementTwo
        
        repeat{
            if arrayElementOne.brend == newArray[index].brend &&
           arrayElementOne.description == newArray[index].description &&
           arrayElementOne.imageName == newArray[index].imageName &&
           arrayElementOne.model == newArray[index].model &&
           arrayElementOne.price == newArray[index].price &&
            arrayElementOne.size == newArray[index].size{
                newArray.remove(at: index)
                index += 1
        
            } else {
                index += 1
        
            }
        } while (index < newArray.count)
        index = 0
    return newArray
    

}
    override  func awakeFromNib() {
        modelLbl.adjustsFontSizeToFitWidth = true
       
    }
    
}

// I wrote the follwing code to implement the back ground color for the shoes in an authomatically way, of course I find a lot on the web, but i need to dive more into down to the page you can find the link

//
//extension UIImage {
//    func resized (toSize: CGSize) -> UIImage{
//    let format = UIGraphicsImageRendererFormat()
//        format.scale = 1
//        format.preferredRange = .standard
//        let render = UIGraphicsImageRenderer(size: size, format: format)
//        let result = render.image {(context) in self.draw(in: CGRect(origin: CGPoint.zero, size: size))}
//        return result
//
//    }
//}
//https://dev.to/neriusv/selecting-colors-using-an-image-in-swift-27l9
