//
//  ViewController.swift
//  GalleryApp
//
//  Created by Sebastian Waloszek on 11/04/17.
//  Copyright © 2017 SW. All rights reserved.
//

import UIKit

class CategoriesCollectionVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate  {
    
    @IBOutlet weak var totalPriceLabel: UIBarButtonItem!
    
    var shoppingCart:ShoppingCart?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingCart = ShoppingCart(items: [Album]())
    }
    
    // MARK: Lifecycles
    override func viewWillAppear(_ animated: Bool) {
        loadTotalPrice()
    }
    
    private func loadTotalPrice(){
        totalPriceLabel.title = "$" + String(format: "%.2f", shoppingCart?.totalprice ?? 0)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TestData.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath as IndexPath) as! CategoryViewCell
        cell.categoryImage.image = UIImage.init(named: TestData.categories[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Albums", bundle: nil)
        let albumsVC = storyboard.instantiateViewController(withIdentifier: "detailVC") as! AlbumsCollectionVC
        albumsVC.displayedCategory = TestData.categories[indexPath.item]
        albumsVC.displayedAlbums = TestData.testAlbums.filter({ album -> Bool in
            return album.category! == TestData.categories[indexPath.item]
        })
        albumsVC.shoppingCart = shoppingCart
        navigationController?.pushViewController(albumsVC,animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let shoppingCartVC = segue.destination as? ShoppingCartVC{
            shoppingCartVC.shoppingCart = shoppingCart
        }
    }
}

