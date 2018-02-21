//
//  ShoppingCartViewController.swift
//  MusicApp2
//
//  Created by Sebastian Waloszek on 31/05/2017.
//  Copyright © 2017 Sebastian Waloszek. All rights reserved.
//

import UIKit

class ShoppingCartVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UIGestureRecognizerDelegate {
    
    var shoppingCart:ShoppingCart?

    // IBOutlets & IBActions
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var totalPriceLabel: UIBarButtonItem!
    
    @IBAction func shoppingCartBuyPressed(_ sender: Any) {
        if shoppingCart == nil || shoppingCart?.items == nil || shoppingCart?.items.count == 0 {
            let alert = UIAlertController(
                title: "Failed!!!",
                message: "Your shopping cart is empty!",
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
                title: "Success!!!",
                message: "Your order has been accepted!",
                preferredStyle: UIAlertControllerStyle.alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.default,
                handler: nil)
            )
            self.present(alert, animated: true, completion: nil)

            shoppingCart?.items.removeAll()
            setTotalPrice()
            collectionView.reloadData()
        }
    }
    
    // Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setTotalPrice()
        addDeleteGesture()
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTotalPrice()
    }
    
    func addDeleteGesture(){
        let lpgr : UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleDeleteGesture(gestureRecognizer:)))
        lpgr.minimumPressDuration = 0.5
        lpgr.delegate = self
        lpgr.delaysTouchesBegan = true
        self.collectionView.addGestureRecognizer(lpgr)
    }
    
    func handleDeleteGesture(gestureRecognizer : UILongPressGestureRecognizer){
        if (gestureRecognizer.state != UIGestureRecognizerState.ended){
            return
        }
        
        let p = gestureRecognizer.location(in: self.collectionView)
        
        if let indexPath:IndexPath = (self.collectionView.indexPathForItem(at: p)){
            let alert = UIAlertController(
                title: "Are you sure?",
                message: "Delete this album from shopping cart?",
                preferredStyle: UIAlertControllerStyle.alert
            )
            alert.addAction(UIAlertAction(
                title: "Yes",
                style: UIAlertActionStyle.destructive,
                handler: { [weak self] action in
                self?.deleteItemInCollection(indexPath: indexPath as IndexPath)
                self?.setTotalPrice()
            }))
            alert.addAction(UIAlertAction(
                title: "No",
                style: UIAlertActionStyle.default,
                handler: nil)
            )
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func deleteItemInCollection(indexPath:IndexPath){
        shoppingCart?.items.remove(at: indexPath.item)
        collectionView.reloadData()
    }
    
    private func setTotalPrice(){
        guard let totalPrice = shoppingCart?.totalprice else{
            totalPriceLabel.title = "Total price: $0.00"
            return
        }
        totalPriceLabel.title = "Total price: $" + String(format: "%.2f", totalPrice)
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingCart?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shoppingCartCell", for: indexPath as IndexPath) as! AlbumViewCell
        if let shoppingCart = shoppingCart{
            cell.setUpVisually(withAlbum: shoppingCart.items[indexPath.item])
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let shoppingCartVC = segue.destination as? ShoppingCartVC{
            shoppingCartVC.shoppingCart = shoppingCart
        }
    }
}
