//
//  TWTracker.swift
//  TrackingWidget
//
//  Created by Matt Beaney on 10/02/2018.
//  Copyright © 2018 Beaney. All rights reserved.
//

import Foundation

class TWTracker {
    static var shareTWStore: TWTracker = {
        let store = TWStore(viewedTracks: [], newTracks: [])
        return TWTracker(store: store)
    }()
    
    var store: TWStore
    
    init(store: TWStore) {
        self.store = store
    }
    
    func track(with name: String, and dict: [AnyHashable : Any]) {
        let track = TWTrack(name: name, dict: dict, date: Date())
        self.store.newTracks.append(track)
    }
    
    func setTracksViewed() {
        self.store.mergeTracks()
    }
    
    func clearTracks() {
        self.store.clearTracks()
    }
}
