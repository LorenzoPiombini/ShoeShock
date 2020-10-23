//
//  Shoes.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/15/20.
//

import Foundation

struct Shoes {
    private(set) public var model: String
    private(set) public var size: Int
    private(set) public var brend: String
    private(set) public var imageName: String
    private(set) public var price: String
    private(set) public var description: String
    
    init(model:String, size:Int, brend: String, imageName: String, price: String, description: String){
        self.model = model
        self.size = size
        self.brend = brend
        self.imageName = imageName
        self.price = price
        self.description = description
    }
}

struct ShoeDisplayed {
    private(set) public var model: String
    private(set) public var size: Int
    private(set) public var brend: String
    private(set) public var imageName: String
    private(set) public var price: String
    private(set) public var description: String
    
    init(model:String, size:Int, brend: String, imageName: String, price: String, description: String){
        self.model = model
        self.size = size
        self.brend = brend
        self.imageName = imageName
        self.price = price
        self.description = description
    }
}
