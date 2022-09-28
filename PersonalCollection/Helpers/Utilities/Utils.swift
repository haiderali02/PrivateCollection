//
//  Utils.swift
//  PersonalCollection
//
//  Created by Haider Ali on 29/09/2022.
//  Copyright © 2022 haiderapps. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
}

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertController, animated: true)
    }
    
}
