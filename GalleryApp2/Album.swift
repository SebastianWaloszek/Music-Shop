//
//  Album.swift
//  MusicApp2
//
//  Created by Sebastian Waloszek on 31/05/2017.
//  Copyright © 2017 Sebastian Waloszek. All rights reserved.
//

import Foundation

class Album{
    
    var coverName:String? = nil
    var category:String? = nil
    var albumName:String? = nil
    var artistName:String? = nil
    var price:Float? = nil
    
    
    init(coverName:String,category:String,albumName:String,artistName:String,price: Float) {
        self.coverName = coverName
        self.category = category
        self.albumName = albumName
        self.artistName = artistName
        self.price = price
    }
    
}
