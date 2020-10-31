//
//  brandCollectionViewCell.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/16/20.
//

import UIKit

class brandCollectionViewCell: UICollectionViewCell {
    
 
    
    @IBOutlet weak var brandButton: UIButton!
    @IBOutlet weak var parentView: UIViewController!
    @IBOutlet weak var shoeCollectionView: UICollectionView!
    
    func updateViews(shoes: Shoes){
        brandButton.setTitle("\(shoes.brend)", for: .normal)
       
    }
    
   // I am stil trying how to do it :
    // this was supposed to select the brand and showing the array accordingly. but I am struggling to understand how to trig it from the Collection viewCell, I could do it form th discoverVC , how ever i could`t declair the IbOutlet for the BrandBtn because it threw an error like illigal configuration
    // I will love to have your suggestions
    
    @IBAction func selectingTheShoesBrand(_ sender: Any?){
//        var shoe = DataService.instance.getShoes()
//        DataService.instance.brandArray = DataService.instance.getShoes(byBrand:brandButton, fromThisShoes: shoe)
//        //var n = ViewController.viewDidLoad(parentView as! ViewController)
//        brandButton.isHighlighted = true
//        if brandButton.isHighlighted == true {
//
//      //
         
        }
      
        
        }
    

    

