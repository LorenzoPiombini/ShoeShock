//
//  ViewController.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/15/20.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    
    @IBOutlet weak var brandCollection: UICollectionView!
    @IBOutlet weak var shoesCollectionView: UICollectionView!
    @IBOutlet weak var cartBtn: UIBarButtonItem!
    @IBOutlet weak var brandBtn: UIButton!
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
    
        brandCollection.delegate = self
        brandCollection.dataSource = self
        shoesCollectionView.dataSource = self
        shoesCollectionView.delegate = self
        
        
       

         }



    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == brandCollection {
        return DataService.instance.getShoes().count
        }else{
            return DataService.instance.getShoes().count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == brandCollection{
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "puttingTheBrandsInPlace", for: indexPath) as? brandCollectionViewCell {
            let brand = DataService.instance.getShoes()[indexPath.row]
            cell.updateViews(shoes: brand)
            return cell
        } else {
            return brandCollectionViewCell()}
        }else /*if DataService.instance.brandArray.count == 0 */{ // this was an attempt to display the shoes order by brand, however i need help to do so as you can see from the brandCollectionViewCell file, I did not ask that question in the chat to avoid bothering anyone since it is not a project`s requirement.
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "showingTheShoes", for: indexPath) as? shoesCollectionVCell {
                   let shoe = DataService.instance.getShoes()[indexPath.row]
                   cell.updateShoesView(forShoes: shoe)
                   return cell
            }
          else /* if DataService.instance.brandArray.count != 0 {
//                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "showingTheShoes", for: indexPath) as? shoesCollectionVCell {
//                    let shoeByBrand = DataService.instance.brandArray[indexPath.row]
//                    cell.updateShoesView(forShoes: shoeByBrand)
//                    return cell
//                } else */{
                    return shoesCollectionVCell()
                }
        }
    }
       

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == shoesCollectionView {
            let shoes = DataService.instance.getShoes()[indexPath.row]
        performSegue(withIdentifier: "showDetailShoesTapped", sender: shoes)
        }
        
        
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let shoeVc = segue.destination as? ShoeVc {
            shoeVc.initShoes(shoe: sender as! Shoes )
        }
    
    
    }
    
    @IBAction func sendingDataToCartVc (){
        let cart = DataService.instance.cart
        performSegue(withIdentifier: "ShowingCArt", sender: cart)
    }
    


}
