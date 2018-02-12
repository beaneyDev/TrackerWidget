//
//  TWListViewController.swift
//  TrackingWidget
//
//  Created by Matt Beaney on 10/02/2018.
//  Copyright © 2018 Beaney. All rights reserved.
//

import Foundation
import UIKit

class TWListViewController : UIViewController {
    
    @IBOutlet weak var cview: UICollectionView!
    
    var tracks: [TWTrack] = []
    
    override func viewDidLoad() {
        self.cview.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        self.cview.layer.borderWidth = 2.0
        let nib = UINib(nibName: "TWListCollectionViewCell", bundle: nil)
        self.cview.register(nib, forCellWithReuseIdentifier: "cell")
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
        
        self.tracks = [TWTrack(name: "Test Track", dict: testDict, date: Date())]
        self.cview.reloadData()
    }
}

extension TWListViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let track = self.tracks[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "track") as? TWTrackViewController {
            vc.track = track
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension TWListViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TWListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let track = self.tracks[indexPath.row]
        cell.configure(track: track, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tracks.count
    }
}

extension TWListViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 75.0)
    }
}
