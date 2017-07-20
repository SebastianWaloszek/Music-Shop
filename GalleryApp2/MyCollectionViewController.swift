//
//  ViewController.swift
//  GalleryApp
//
//  Created by Sebastian Waloszek on 11/04/17.
//  Copyright © 2017 SW. All rights reserved.
//

import UIKit

class MyCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate  {
    
    @IBOutlet weak var totalPriceLabel: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(String(), forKey: "ShoppingCart")
        UserDefaults.standard.set(Float(), forKey: "TotalPrice")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let totalPrice  = UserDefaults.standard.object(forKey: "TotalPrice") as? Float ?? Float()
        
        
        totalPriceLabel.title = "$" + String(format: "%.2f", totalPrice)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryItems.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MyCollectionViewCell
    
        cell.myImage.image = UIImage.init(named: categoryItems[indexPath.item])

        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "detailVC") as! AlbumsCollectionViewController
        
        vc.category = indexPath.item
        
        navigationController?.pushViewController(vc,animated: true)
        
        
    }
    

}

