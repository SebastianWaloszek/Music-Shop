//
//  AlbumsCollectionViewController.swift
//  MusicApp2
//
//  Created by Sebastian Waloszek on 05/05/17.
//  Copyright © 2017 Sebastian Waloszek. All rights reserved.
//

import UIKit


class AlbumsCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    var items = [""]
    var authors = [""]
    var titles = [""]
    var prices = [""]
    
    var category = 0
    
    @IBOutlet weak var totalPriceLabel: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let totalPrice  = UserDefaults.standard.object(forKey: "TotalPrice") as? Float ?? Float()
        
        totalPriceLabel.title = "$" + String(format: "%.2f", totalPrice)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let totalPrice  = UserDefaults.standard.object(forKey: "TotalPrice") as? Float ?? Float()
        
        totalPriceLabel.title = "$" + String(format: "%.2f", totalPrice)
    }
    
    func decideOnCategory(){
        switch category {
        case 0:
            items = discoAlbumsCovers
            authors = discoAuthors
            titles = discoTitles
            prices = discoPrices
            break
        case 1:
            items = jazzAlbumsCovers
            authors = jazzAuthors
            titles = jazzTitles
            prices = jazzPrices
            break
        case 2:
            items = popAlbumsCovers
            authors = popAuthors
            titles = popTitles
            prices = popPrices
            break
        case 3:
            items = rockAlbumsCovers
            authors = rockAuthors
            titles = rockTitles
            prices = rockPrices
            break
        default:
            print("Unknown category!")
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        decideOnCategory()
        return self.items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MyCollectionViewCell
        
        cell.myImage.image = UIImage.init(named: self.items[indexPath.item])
        cell.albumName.text = titles[indexPath.item]
        cell.artistName.text = authors[indexPath.item]
        cell.price.text = "$" + prices[indexPath.item]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "albumVC") as! AudioPlayerViewController
        
        vc.category = category
        
        vc.album = indexPath.item
        vc.albumName = titles[indexPath.item]
        vc.artist = authors[indexPath.item]
        vc.price = prices[indexPath.item]
        
        navigationController?.pushViewController(vc,animated: true)
        
        
    }
    

}
