//
//  Album.swift
//  MusicApp2
//
//  Created by Sebastian Waloszek on 31/05/2017.
//  Copyright © 2017 Sebastian Waloszek. All rights reserved.
//

import Foundation
import UIKit

class Album{
    var cover:UIImage?
    var category:String?
    var name:String?
    var artistName:String?
    var price:Float?
    var songName:String?
    
    init(cover:UIImage,category:String,name:String,artistName:String,price: Float,songName:String) {
        self.cover = cover
        self.category = category
        self.name = name
        self.artistName = artistName
        self.price = price
        self.songName = songName
    }
}
