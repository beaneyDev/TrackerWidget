//
//  TWListCollectionViewCell.swift
//  TrackingWidget
//
//  Created by Matt Beaney on 10/02/2018.
//  Copyright © 2018 Beaney. All rights reserved.
//

import UIKit

class TWListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    func configure(track: TWTrack, index: Int) {
        self.lblTitle.text = track.name
        self.lblDate.text = "Now"
        
        if index % 2 == 0 {
            self.backgroundColor = UIColor.groupTableViewBackground
        } else {
            self.backgroundColor = UIColor.white
        }
    }
}
