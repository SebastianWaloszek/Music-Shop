//
//  Constants.swift
//  MusicApp2
//
//  Created by Sebastian Waloszek on 01/06/2017.
//  Copyright © 2017 Sebastian Waloszek. All rights reserved.
//

import Foundation
import UIKit

class TestData{

static var testAlbums = [
    Album(cover: UIImage.init(imageLiteralResourceName: "cover_adventure"),  category: "disco_1", name: "Adventure",     artistName: "Madeon",          price: 11.99, songName: "05 Pay No Mind (feat. Passion Pit)"),
    Album(cover: UIImage.init(imageLiteralResourceName: "cover_bettername"), category: "disco_1", name: "Better Name",   artistName: "Deadmau5",        price: 9.99,  songName: "02 - Deadmau5 - For Lack Of A Better Name - Moar Ghosts N Stuff"),
    Album(cover: UIImage.init(imageLiteralResourceName: "cover_clarity"),    category: "disco_1", name: "Clarity",       artistName: "Zedd" ,           price: 14.90, songName: "05 - Zedd - Clarity (Feat. Foxes)"),
    Album(cover: UIImage.init(imageLiteralResourceName:  "cover_opus"),       category: "disco_1", name: "Opus",          artistName: "Eric Prydz",      price: 11.99, songName: "17-eric_prydz-liberate-098cc1"),
    Album(cover: UIImage.init(imageLiteralResourceName: "cover_spitfire"),   category: "disco_1", name: "Spitfire",      artistName: "Porter Robinson", price: 9.99,  songName: "02. Porter Robinson - Unison (Original Mix)_[plixid.com]"),
    Album(cover: UIImage.init(imageLiteralResourceName:  "cover_w2016"),      category: "disco_1", name: "W2016",         artistName: "Deadmau5",        price: 11.99, songName: "03. Cat Thruster"),
    Album(cover: UIImage.init(imageLiteralResourceName: "cover_while"),      category: "disco_1", name: "While",         artistName: "Deadmau5",        price: 12.99, songName: "2-13 Pets"),
    Album(cover: UIImage.init(imageLiteralResourceName: "cover_blue"),       category: "jazz_1",  name: "Kind of Blues", artistName: "Miles Davis",     price: 9.99,  songName: "10 So What 1"),
    Album(cover: UIImage.init(imageLiteralResourceName: "cover_artpop"),     category: "pop_1",   name: "ARTPOP",        artistName: "Lady Gaga",       price: 9.99,  songName: "01 Aura"),
    Album(cover: UIImage.init(imageLiteralResourceName: "cover_tdsotm"),     category: "rock_1",  name: "Dark Side",     artistName: "Pink Floyd",      price: 11.99, songName: "07. Any Colour You Like")
]

static var categories = ["disco_1", "jazz_1", "pop_1", "rock_1"]

//
//var discoAlbumsCovers = ["cover_adventure", "cover_bettername", "cover_clarity", "cover_opus","cover_spitfire","cover_w2016","cover_while"]
//var jazzAlbumsCovers = ["cover_blue"]
//var popAlbumsCovers = ["cover_artpop"]
//var rockAlbumsCovers = ["cover_tdsotm"]
//
//var discoAuthors = ["Madeon"  ,"Deadmau5"   ,"Zedd"   ,"Eric Prydz","Porter Robinson","Deadmau5","Deadmau5"]
//var discoTitles = ["Adventure","Better Name","Clarity","Opus"      ,"Spitfire"       ,"W2016"   ,"While"   ]
//var discoPrices = ["11.99"    ,"9.99"       ,"14.90"  ,"11.99"     ,"9.99"           ,"11.99"   ,"12.99"   ]
//
//var jazzAuthors = ["Miles Davis"  ]
//var jazzTitles =  ["Kind of Blues"]
//var jazzPrices =  ["9.99"]
//
//var popAuthors = ["Lady Gaga"]
//var popTitles =  ["ARTPOP"]
//var popPrices =  ["9.99"]
//
//var rockAuthors = ["Pink Floyd"]
//var rockTitles =  ["Dark Side"]
//var rockPrices =  ["11.99"]
//
//var discoSongs = ["05 Pay No Mind (feat. Passion Pit)",
//                  "02 - Deadmau5 - For Lack Of A Better Name - Moar Ghosts N Stuff",
//                  "05 - Zedd - Clarity (Feat. Foxes)",
//                  "17-eric_prydz-liberate-098cc1",
//                  "02. Porter Robinson - Unison (Original Mix)_[plixid.com]",
//                  "03. Cat Thruster",
//                  "2-13 Pets"]
//
//var jazzSongs = ["10 So What 1"]
//var popSongs = ["01 Aura"]
//var rockSongs = ["07. Any Colour You Like"]

}
