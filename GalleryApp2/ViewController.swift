//
//  ViewController.swift
//  GalleryApp2
//
//  Created by Sebastian Waloszek on 30/04/2017.
//  Copyright © 2017 Sebastian Waloszek. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    

    @IBOutlet weak var slider: UISlider!
    
    var frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)


    
    var startingPage:Int = 0
    
    var player = AVAudioPlayer()

 
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    

    @IBAction func pause(_ sender: Any) {
        player.pause()
    }


    @IBAction func sliderMoved(_ sender: Any) {
        player.volume = slider.value
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width);
        
        let resourceName = songList[page]
        
        let audioPath = Bundle.main.path(forResource: resourceName, ofType: "mp3")
        
        do{
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
        }
        catch{
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        
        self.view.addSubview(scrollView)
        
        
        for index in 0..<imageList.count {
            
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame.size = self.scrollView.frame.size
            
            let subView = UIImageView(frame: frame)
            
            subView.image = UIImage(named: imageList[index])
            subView.contentMode = .scaleAspectFit
            
            self.scrollView .addSubview(subView)
        }
        
        self.scrollView.isPagingEnabled = true
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * CGFloat(imageList.count), height:self.scrollView.frame.size.height/2)
        
        let x = CGFloat(startingPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
        
        let resourceName = "song_1"
        let audioPath = Bundle.main.path(forResource: resourceName, ofType: "mp3")
        
        do{
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
        }
        catch{
            
        }
    }
    
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}

