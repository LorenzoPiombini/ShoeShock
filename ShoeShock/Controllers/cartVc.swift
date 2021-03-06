//
//  cartVc.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/24/20.
//

import UIKit

class cartVc: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
 
    var cart = DataService.instance.cart
    @IBOutlet weak var cartTableView: UITableView!
    

    
    // button triggin the alert message of purchasing done, or if it is empty it will show a message accordingly
    @IBAction func showingPurchase(_ sender: Any) {
        if DataService.instance.cart.count == 0 {
            let message = UIAlertController(title: "select a shoe at least ", message: "You can't purchase anything if your cart is empty!", preferredStyle: UIAlertController.Style.alert)
            message.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(message, animated: true, completion: nil)
        } else {
            let messagePurchase = UIAlertController(title: "Thank you!! we appreciate your bussines!", message: "hoping you have a great experience, have a great day!", preferredStyle: UIAlertController.Style.alert)
            messagePurchase.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(messagePurchase, animated: true, completion: nil)
            DataService.instance.cart.removeAll()
            cartTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.delegate = self
        cartTableView.dataSource = self
    
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartItem", for: indexPath) as? carTableViewCell{
            let cartItem = DataService.instance.cart[indexPath.row]
            cell.updateCartView(shoe: cartItem)
            return cell
        }
        return carTableViewCell()
    }
   
    func addingThePrice() {

        
        
    }
    
}
