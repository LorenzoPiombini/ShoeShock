//
//  drawingCurrencySignToAvoidStepperCalculationIssue.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/30/20.
//

import UIKit

class drawingCurrencySignToAvoidStepperCalculationIssue: UILabel {

    
    override func draw(_ rect: CGRect) {
        let size:CGFloat = 15
        let currencyLbl = UILabel(frame: CGRect(x: 0, y: (frame.size.height/2) - size / 2, width: size, height: size))
        currencyLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        currencyLbl.textAlignment = .center
        currencyLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        currencyLbl.text = formatter.currencySymbol
        addSubview(currencyLbl)
        currencyLbl.clipsToBounds = true
        super.draw(rect) // i put super draw here otherwise i could not see the price in the label 
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
