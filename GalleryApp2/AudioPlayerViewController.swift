//
//  ViewController.swift
//  Audio Player
//
//  Created by Sebastian Waloszek on 08/01/17.
//  Copyright © 2017 SW. All rights reserved.
//

import UIKit
import AVFoundation

var shoppingCartItems:[Album]?

class AudioPlayerViewController: UIViewController {
        
    var items = [""]
    var songs = [""]
    
    var albumName = " "
    var artist = " "
    var price = ""
    
    var category = 0
    var album = 0
    
    var player = AVAudioPlayer()
    var timer = Timer()

    @IBOutlet weak var totalPriceLabel: UIBarButtonItem!

    
    @IBAction func play(_ sender: Any) {
        player.play()

    }
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!

    
    @IBAction func buyPressed(_ sender: Any) {
        
        var shoppingCart  = UserDefaults.standard.object(forKey: "ShoppingCart") as? [String] ?? [String]()
        var totalPrice  = UserDefaults.standard.object(forKey: "TotalPrice") as? Float ?? Float()
        
        var notInShoppingCart = true
        
        for album in shoppingCart {
            if album == albumName {
                notInShoppingCart = false
            }
        }
        
        if notInShoppingCart {
            
            shoppingCart.append(albumName)
            UserDefaults.standard.set(shoppingCart, forKey: "ShoppingCart")

            totalPrice += Float(price)!
            
            totalPriceLabel.title = "$" + String(totalPrice)
            
            UserDefaults.standard.set(totalPrice, forKey: "TotalPrice")
            
            
            let album = Album(coverName: items[self.album], category: String(category), albumName: albumNameLabel.text!, artistName: artistNameLabel.text!, price: Float(price)!)
            
            if shoppingCartItems == nil {
                shoppingCartItems = [Album]()
            }
            
            shoppingCartItems?.append(album)
            
            let alert = UIAlertController(title: "Success!!", message: "Album added to shopping cart.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else{
            let alert = UIAlertController(title: ":(", message: "Album already in shopping cart!!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func decideOnCategory(){
        switch category {
        case 0:
            items = discoAlbumsCovers
            songs = discoSongs
            break
        case 1:
            items = jazzAlbumsCovers
            songs = jazzSongs

            break
        case 2:
            items = popAlbumsCovers
            songs = popSongs
            break
        case 3:
            items = rockAlbumsCovers
            songs = rockSongs
            break
        default:
            print("Unknown category!")
            
        }
    }

    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }


    
    @IBOutlet weak var slider: UISlider!
    

    @IBOutlet weak var albumCover: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decideOnCategory()

        
        albumNameLabel.text = albumName
        artistNameLabel.text = artist
        priceLabel.text = "$" + price
        
        albumCover.image = UIImage.init(named: self.items[album])
        
        let resourceName = songs[album]
        let audioPath = Bundle.main.path(forResource: resourceName, ofType: "mp3")
        
        do{
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))

        }
        catch{
            
        }
        
        let totalPrice  = UserDefaults.standard.object(forKey: "TotalPrice") as? Float ?? Float()
        
        totalPriceLabel.title = "$" + String(format: "%.2f", totalPrice)
        
        slider.setValue(player.volume, animated: true)
    }
    

    internal override func viewWillAppear(_ animated: Bool) {
        let totalPrice  = UserDefaults.standard.object(forKey: "TotalPrice") as? Float ?? Float()
        
        totalPriceLabel.title = "$" + String(format: "%.2f", totalPrice)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ sender: Any) {
        player.volume = slider.value
    }

}

