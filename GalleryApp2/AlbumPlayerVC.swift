//
//  ViewController.swift
//  Audio Player
//
//  Created by Sebastian Waloszek on 08/01/17.
//  Copyright © 2017 SW. All rights reserved.
//

import UIKit
import AVFoundation

class AlbumPlayerVC: UIViewController {
    var album:Album?
    
    var player = AVAudioPlayer()
    var timer = Timer()
    var shoppingCart:ShoppingCart?

    @IBOutlet weak var totalPriceLabel: UIBarButtonItem!

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var albumCover: UIImageView!
    
    // MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPlayer()
        setUpVisually()
    }
    
    // MARK: Lifecycles
    override func viewWillAppear(_ animated: Bool) {
        loadTotalPrice()
    }
    
    private func loadTotalPrice(){
        totalPriceLabel.title = "$" + String(format: "%.2f", shoppingCart?.totalprice ?? 0)
    }
    
    private func setUpVisually(){
        if let album = album{
            albumNameLabel.text = album.name
            artistNameLabel.text = album.artistName
            priceLabel.text = "$\(album.price!)"
            albumCover.image = album.cover
        }
        slider.setValue(player.volume, animated: true)
    }
    
    private func setUpPlayer(){
        if let album = album{
            let resourceName = album.songName
            let audioPath = Bundle.main.path(forResource: resourceName, ofType: "mp3")
            do{
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            }catch let error{
                print(error.localizedDescription)
            }
        }
    }
    
    // IBActions
    @IBAction func sliderMoved(_ sender: Any) {
        player.volume = slider.value
    }
    
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buyPressed(_ sender: Any) {
        var notInShoppingCart = true

        if let shoppingCart = shoppingCart, let album = album{
            for album in shoppingCart.items {
                if let albumName = self.album?.name, album.name == albumName {
                    notInShoppingCart = false
                }
            }
            
            if notInShoppingCart {
                shoppingCart.items.append(album)
                loadTotalPrice()
                
                let alert = UIAlertController(
                    title: "Success!!",
                    message: "Album added to shopping cart.",
                    preferredStyle: UIAlertControllerStyle.alert
                )
                alert.addAction(UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: nil)
                )
                self.present(alert, animated: true, completion: nil)
            }
            else{
                let alert = UIAlertController(
                    title: ":(",
                    message: "Album already in shopping cart!!",
                    preferredStyle: UIAlertControllerStyle.alert
                )
                alert.addAction(UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.default,
                    handler: nil)
                )
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let shoppingCartVC = segue.destination as? ShoppingCartVC{
            shoppingCartVC.shoppingCart = shoppingCart
        }
    }
}
