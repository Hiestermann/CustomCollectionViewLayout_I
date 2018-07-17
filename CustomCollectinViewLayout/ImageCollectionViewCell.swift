//
//  ImageCollectionViewCell.swift
//  CustomCollectinViewLayout
//
//  Created by Kilian on 17.07.18.
//  Copyright © 2018 Kilian. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    var image: UIImage? {
        get{return imageView.image}
        set{
            imageView.image = newValue
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "golf")
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        
        addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
