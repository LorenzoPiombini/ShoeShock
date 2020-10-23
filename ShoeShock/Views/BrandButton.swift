//
//  BrandButton.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/16/20.
//

import UIKit

class BrandButton: UIButton {

    func stylingBtnBrandCollectionView(){
        titleLabel?.font = UIFont(name: "Futura", size: 13)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        clipsToBounds = true
        setTitleColor(.gray, for: .normal)
        setTitleColor(.black, for: .highlighted)
        

    }

    
    override func awakeFromNib() {
        stylingBtnBrandCollectionView()
    }
}
