//
//  AlbumsCollectionViewController.swift
//  MusicApp2
//
//  Created by Sebastian Waloszek on 05/05/17.
//  Copyright © 2017 Sebastian Waloszek. All rights reserved.
//

import UIKit

class AlbumsCollectionVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var shoppingCart:ShoppingCart?
    var displayedCategory:String?
    var displayedAlbums: [Album]?
    
    @IBOutlet weak var totalPriceLabel: UIBarButtonItem!

    // MARK: Lifecycles
    override func viewWillAppear(_ animated: Bool) {
        loadTotalPrice()
    }
    
    private func loadTotalPrice(){
        totalPriceLabel.title = "$" + String(format: "%.2f", shoppingCart?.totalprice ?? 0)
    }
    
    // MARK: CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedAlbums?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath as IndexPath) as! AlbumViewCell
        if let displayedAlbums = displayedAlbums{
            cell.setUpVisually(withAlbum: displayedAlbums[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "AlbumPlayer", bundle: nil)
        let albumPlayerVC = storyboard.instantiateViewController(withIdentifier: "albumVC") as! AlbumPlayerVC
        if let displayedAlbums = displayedAlbums{
            albumPlayerVC.album = displayedAlbums[indexPath.item]
        }
        albumPlayerVC.shoppingCart = shoppingCart
        navigationController?.pushViewController(albumPlayerVC,animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let shoppingCartVC = segue.destination as? ShoppingCartVC{
            shoppingCartVC.shoppingCart = shoppingCart
        }
    }
}
