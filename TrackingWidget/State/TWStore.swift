//
//  TrackingWidgetStore.swift
//  TrackingWidget
//
//  Created by Matt Beaney on 10/02/2018.
//  Copyright © 2018 Beaney. All rights reserved.
//

import Foundation

class TWStore {
    var viewedTracks: [TWTrack]
    var newTracks: [TWTrack]
    
    init(viewedTracks: [TWTrack], newTracks: [TWTrack]) {
        self.viewedTracks = viewedTracks
        self.newTracks = newTracks
    }
    
    func mergeTracks() {
        self.viewedTracks.append(contentsOf: self.newTracks)
        self.newTracks = []
    }
    
    func clearTracks() {
        self.viewedTracks = []
        self.newTracks = []
    }
}
