//
//  carTableViewCell.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/24/20.
//

import UIKit

class carTableViewCell: UITableViewCell, UITableViewDelegate {
   
    

    var oldStepperValue = 1.0 // this variables is useful for the stepper, it has to be at 1 becuause the program will use it for recalculate the actual shoes price by dividing the current price with the oldStepperValue.
    var newStepperVAlue = 0.0
    
    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var backgroundColorLbl: UILabel!
    @IBOutlet weak var valueStepperLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var tableViewParent: UITableView!
    
 
    func stepperCalculatingNewQuantityAndPriceIfincreasing(price: UILabel, StepperValue: UIStepper){
        let Price = Int(price.text!)!
        let realPrice = Price / Int(oldStepperValue)
        valueStepperLabel.text = Int(StepperValue.value).description
        price.text = "\((realPrice) * Int(StepperValue.value))"
    }
    
    
    
    @IBAction func changingQuantity (_sender: UIStepper){
      
        if  _sender.value != 0.0 {
                          stepperCalculatingNewQuantityAndPriceIfincreasing(price: priceLbl, StepperValue: stepper)
                          oldStepperValue = stepper.value
        }else {
            // helped from Alvin !!! thank you so much
            let point = cartImage.convert(CGPoint.zero, to: tableViewParent)
            guard let indexPath = tableViewParent.indexPathForRow(at: point) else {
             return
        }
           
            DataService.instance.cart.remove(at: indexPath.row)
            tableViewParent.reloadData()
    }
    }
        
    
 

    
    func updateCartView(shoe: Shoes){
        priceLbl.text = shoe.price
        modelLbl.text = shoe.model
        cartImage.image = UIImage(named: shoe.imageName)
        var point = cartImage.convert(CGPoint.zero, to: tableViewParent)
      
        // calculating the center of UIImageView
//        point.x = point.x + (cartImage.image!.size.width/2)
//        point.y = point.y + (cartImage.image!.size.height/2)
//
//        backgroundColorLbl.backgroundColor = getPixelColor(pos: point, inThis: cartImage)
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

    override func awakeFromNib() {
        super.awakeFromNib()
        if DataService.instance.cart.count != 0 {
        stepper.value = 1
        valueStepperLabel.text = "\(Int(stepper.value))"
        }
        stepper.autorepeat = true
        stepper.wraps = true
        var oldvalue = stepper.value
        
    }

    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
