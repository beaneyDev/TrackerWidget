//
//  TWTrackViewController.swift
//  TrackingWidget
//
//  Created by Matt Beaney on 10/02/2018.
//  Copyright © 2018 Beaney. All rights reserved.
//

import Foundation
import UIKit

class TWTrackViewController : UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var cview: UICollectionView!
    
    var track: TWTrack?
    private var entries: [(key: String, value: String)] = []
    
    override func viewDidLoad() {
        self.cview.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        self.cview.layer.borderWidth = 2.0
        let nib = UINib(nibName: "TrackDetailsCollectionViewCell", bundle: nil)
        self.cview.register(nib, forCellWithReuseIdentifier: "cell")
        if let layout = self.cview.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: self.cview.frame.size.width, height: 1.0)
        }
        
        self.cview.delegate = self
        self.cview.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let testDict: [AnyHashable : Any] = [
            "test1" : "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest",
            "test2" : "test",
            "test3" : "test",
            "test4" : "test"
        ]
        
        self.track = TWTrack(name: "Test Track", dict: testDict, date: Date())
        
        guard let track = track else {
            return
        }
        
        self.entries = track.dict.flatMap { (String(describing: $0), String(describing: $1)) }
        self.lblDate.text = "Today"
        self.lblTitle.text = track.name
        self.cview.reloadData()
    }
}

extension TWTrackViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TrackDetailsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let entry = self.entries[indexPath.row]
        cell.configure(key: entry.key, value: entry.value, index: indexPath.row)
        cell.constraintWidth.constant = collectionView.frame.size.width
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.entries.count
    }
}

extension TWTrackViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 200.0)
    }
}

