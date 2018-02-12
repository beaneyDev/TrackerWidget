//
//  TrackCollectionViewCell.swift
//  TrackingWidget
//
//  Created by Matt Beaney on 10/02/2018.
//  Copyright © 2018 Beaney. All rights reserved.
//

import UIKit

class TrackDetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var constraintWidth: NSLayoutConstraint!
    
    @IBOutlet weak var lblKey: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    
    func configure(key: String, value: String, index: Int) {
        self.lblKey.text = key
        self.lblValue.text = value
        
        if index % 2 == 0 {
            self.backgroundColor = UIColor.groupTableViewBackground
        } else {
            self.backgroundColor = UIColor.white
        }
    }
}
