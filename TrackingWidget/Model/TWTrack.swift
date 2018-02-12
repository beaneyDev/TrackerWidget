//
//  TWTrack.swift
//  TrackingWidget
//
//  Created by Matt Beaney on 10/02/2018.
//  Copyright © 2018 Beaney. All rights reserved.
//

import Foundation

class TWTrack {
    var dict: [AnyHashable : Any]
    var name: String
    var date: Date
    
    init(name: String, dict: [AnyHashable : Any], date: Date) {
        self.dict = dict
        self.name = name
        self.date = date
    }
}
