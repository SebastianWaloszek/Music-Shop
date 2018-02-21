//
//  MyCollectionViewCell.swift
//  GalleryApp
//
//  Created by Tomasz Kaiser on 11/04/17.
//  Copyright © 2017 SW. All rights reserved.
//

import UIKit

class AlbumViewCell: UICollectionViewCell {
    
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var price: UILabel!
    
    func setUpVisually(withAlbum album:Album){
        albumCover.image = album.cover
        albumName.text = album.name
        artistName.text = album.artistName
        price.text = "$" + String(format: "%.2f", album.price!)
    }
}
