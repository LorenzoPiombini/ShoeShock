//
//  ShoeVc.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/20/20.
//

import UIKit

class ShoeVc: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var shoeCollection: UICollectionView!
    

    
    private(set) public var shoes = [Shoes]()
    func initShoes(shoe: Shoes){
        shoes.append(shoe)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        shoeCollection.dataSource = self
        shoeCollection.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Nothing", for: indexPath) as? shoeDetailCollectionViewcell {
            let shoe = shoes[indexPath.row]
            cell.updateShoeDetailView(shoe: shoe)
            return cell
        } else {
            return shoeDetailCollectionViewcell()

        }
    }
    

    
    
    @IBAction func addToCart (_ sender: Any?){
        DataService.instance.cart.append(contentsOf: shoes)
        print(DataService.instance.cart)
    }
}
