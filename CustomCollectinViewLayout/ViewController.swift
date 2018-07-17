//
//  ViewController.swift
//  CustomCollectinViewLayout
//
//  Created by Kilian on 15.07.18.
//  Copyright © 2018 Kilian. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    let images: [UIImage] = {
        return [#imageLiteral(resourceName: "ocean") ,#imageLiteral(resourceName: "golf"), #imageLiteral(resourceName: "music"),#imageLiteral(resourceName: "musician"), #imageLiteral(resourceName: "garlic"), #imageLiteral(resourceName: "dawn"), #imageLiteral(resourceName: "ocean"), #imageLiteral(resourceName: "olives"), #imageLiteral(resourceName: "turtle"), #imageLiteral(resourceName: "spice"), #imageLiteral(resourceName: "pier"), #imageLiteral(resourceName: "ocean") ,#imageLiteral(resourceName: "golf"), #imageLiteral(resourceName: "music"),#imageLiteral(resourceName: "musician"), #imageLiteral(resourceName: "garlic"), #imageLiteral(resourceName: "dawn"), #imageLiteral(resourceName: "ocean"), #imageLiteral(resourceName: "olives"), #imageLiteral(resourceName: "turtle"), #imageLiteral(resourceName: "spice"), #imageLiteral(resourceName: "pier")]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView?.backgroundColor = .white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! ImageCollectionViewCell
        cell.image = images[indexPath.item]
        return cell
    }
    
}

extension ViewController: CustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, widthIndexPath indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    
}

