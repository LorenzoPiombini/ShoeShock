//
//  dataService.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/15/20.
//

import Foundation
import UIKit

class DataService {
    static let instance = DataService()
    private let shoes = [Shoes(model: "Xfg 34 PRO", size: 12, brend: "Adidas", imageName: "Adidas .png", price: "347", description: "New shoe concept, there is no way that you will try other brands in the future"), Shoes(model: "67 TYPO AWE", size: 12, brend: "Nike", imageName: "nike .png", price: "780", description: "New shoe concept, there is no way that you will try other brands in the future"), Shoes(model: "Classic Black 56", size: 11, brend: "Converse", imageName: "allstarNoBackkGround.jpg", price: "76", description: "New shoe concept, there is no way that you will try other brands in the future"), Shoes(model: "CHY 45 cross", size: 10, brend: "Reebook", imageName: "Reebook .png", price: "200", description: "New shoe concept, there is no way that you will try other brands in the future")]
    
    private var shoesBybrand = [Shoes]()
    

    
  
    func getShoes()-> [Shoes]{
        return shoes
    }
    
    
    // this is the function to select the brand from the shoe array and display it accordiingly.
    func getShoes(byBrand: UIButton) -> [Shoes]{
        shoesBybrand = []
        var index = 0
        var element: Shoes
        var shoe = DataService.instance.getShoes()
        for i in shoe {
            if shoe[index].model == byBrand.titleLabel!.text! {
                element = shoe.remove(at: index)
                shoesBybrand.append(element)
                index += 1
            } else {
                index += 1
            }
        }
        return shoesBybrand
    }
    
}
