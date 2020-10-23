//
//  gettingColorFromShoeImage.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/20/20.
//

import UIKit


class gettingColorFromShoeImage: UIImageView {
    
   
    // I did this because I Wanted to get one of the color from the Image,
    // to set the background accordingly and automaticly
    func getPixelColor(pos: CGPoint) -> UIColor{
        let pixeldata = self.image?.cgImage!.dataProvider!.data
        let data: UnsafePointer = CFDataGetBytePtr(pixeldata)
        
        let pixelInfo = (Int((self.image?.size.width)!) * Int(pos.y) + Int(pos.x) ) * 4
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo] + 1) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo] + 2) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo] + 3) / CGFloat(255.0)
         return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
