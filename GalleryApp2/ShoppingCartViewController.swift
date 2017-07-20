//
//  ShoppingCartViewController.swift
//  MusicApp2
//
//  Created by Sebastian Waloszek on 31/05/2017.
//  Copyright © 2017 Sebastian Waloszek. All rights reserved.
//

import UIKit


class ShoppingCartViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UIGestureRecognizerDelegate {
    
    var items = [String]()
    var authors = [String]()
    var titles = [String]()
    var prices = [Float]()
    
    var category = 0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func shoppingCartBuyPressed(_ sender: Any) {
        if shoppingCartItems == nil || shoppingCartItems?.count == 0 {
            let alert = UIAlertController(title: "Failed!!!", message: "Your shopping cart is empty!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Success!!!", message: "Your order has been accepted!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            let temp = [String]()
            UserDefaults.standard.set(temp, forKey: "ShoppingCart")
            
            totalPrice = 0
            UserDefaults.standard.set(totalPrice, forKey: "TotalPrice")
            setTotalPrice()
            
            items = [String]()
            authors = [String]()
            titles = [String]()
            prices = [Float]()
            shoppingCartItems?.removeAll()
            
            collectionView.reloadData()

        }
    }
    
    @IBOutlet weak var totalPriceLabel: UIBarButtonItem!
    
    var totalPrice:Float?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        setTotalPrice()
        
        let lpgr : UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureRecognizer:)))
        lpgr.minimumPressDuration = 0.5
        lpgr.delegate = self
        lpgr.delaysTouchesBegan = true
        self.collectionView.addGestureRecognizer(lpgr)
        collectionView.dataSource = self
        
    }
    
    func handleLongPress(gestureRecognizer : UILongPressGestureRecognizer){
        
        if (gestureRecognizer.state != UIGestureRecognizerState.ended){
            return
        }
        
        let p = gestureRecognizer.location(in: self.collectionView)
        
        if let indexPath:IndexPath = (self.collectionView.indexPathForItem(at: p)){
            
            let alert = UIAlertController(title: "Are you sure?", message: "Delete this album from shopping cart?", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "YES", style: UIAlertActionStyle.default, handler: { action in
                self.deleteItemInCollection(indexPath: indexPath as IndexPath)
            }))
            alert.addAction(UIAlertAction(title: "NO", style: UIAlertActionStyle.default, handler: nil))
            

            self.present(alert, animated: true, completion: nil)

        }
        
    }
    
    private func deleteItemInCollection(indexPath:IndexPath){
        
        shoppingCartItems!.remove(at: indexPath.item)
        
        totalPrice = totalPrice! - prices[indexPath.item]
        UserDefaults.standard.set(totalPrice, forKey: "TotalPrice")
        setTotalPrice()
        
        var shoppingCart  = UserDefaults.standard.object(forKey: "ShoppingCart") as? [String] ?? [String]()
        var temp = [String]()
        
        for i in 0...shoppingCart.count-1 {
            if shoppingCart[i] != titles[indexPath.item] {
                temp.append(shoppingCart[i])
            }
        }
        UserDefaults.standard.set(temp, forKey: "ShoppingCart")
        
        items = [String]()
        authors = [String]()
        titles = [String]()
        prices = [Float]()
        
        collectionView.reloadData()
    }
    
    private func setTotalPrice(){
        totalPrice  = UserDefaults.standard.object(forKey: "TotalPrice") as? Float ?? Float()
        if totalPrice == 0 {
            totalPriceLabel.title = "Total price: $0.00"
        }
        else{
            totalPriceLabel.title = "Total price: $" + String(format: "%.2f", totalPrice!)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTotalPrice()

    }
    
    func decideOnCategory(){

        if shoppingCartItems != nil {
        
        for item in shoppingCartItems! {
            
            items.append(item.coverName!)
            authors.append(item.artistName!)
            titles.append(item.albumName!)
            prices.append(item.price!)
 
            }
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
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shoppingCartCell", for: indexPath as IndexPath) as! MyCollectionViewCell
        
        cell.myImage.image = UIImage.init(named: self.items[indexPath.item])
        cell.albumName.text = titles[indexPath.item]
        cell.artistName.text = authors[indexPath.item]
        cell.price.text = "$" + String(format: "%.2f", prices[indexPath.item])
        return cell
    }
    
}
