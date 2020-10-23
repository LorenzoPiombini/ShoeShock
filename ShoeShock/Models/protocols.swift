//
//  protocols.swift
//  ShoeShock
//
//  Created by Lorenzo piombini on 10/21/20.
//

import Foundation
import UIKit

protocol sendingTheActualData {
    
    func sendingData(_ from: UICollectionViewCell, DidSelectItemAt indexPath:IndexPath, toView: UIViewController )
}
