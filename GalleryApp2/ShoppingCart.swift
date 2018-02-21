//
//  ShoppingCart.swift
//  MusicShop
//
//  Created by Sebastian Waloszek on 21/02/2018.
//  Copyright © 2018 Sebastian Waloszek. All rights reserved.
//

import Foundation

class ShoppingCart{
    var items:[Album] = [Album]()
    var totalprice:Float{
        get{
            return items.reduce(0) { $0 + $1.price!}
        }
    }
    
    init(items: [Album]) {
        self.items = items
    }
}
