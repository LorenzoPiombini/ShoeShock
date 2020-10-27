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
   
    
}
