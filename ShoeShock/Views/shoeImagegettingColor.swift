//
//  shoeImagegettingColor.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/18/20.
//

import UIKit
import CoreGraphics

class shoeImagegettingColor: UIImageView {
    @IBOutlet weak var imageToGetPixelFrom: UIImageView!
    
    
    func getPixelColor(position: CGPoint, image: UIImage){
        
        
        let pixeldata = CGDataProvider(CGImageGet)
        let data: UnsafePointer = CFDataGetBytePtr(pixeldata)
        
    }
}
