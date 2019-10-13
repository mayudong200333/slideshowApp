//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 馬煜東 on 2019/10/13.
//  Copyright © 2019年 ikutou.ba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    
    var timer:Timer!
    var timer_sec:Float=0
    let images = [UIImage(named:"1.jpg"),UIImage(named: "2.jpg"),UIImage(named: "3.jpg")]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = images[index]
        imageView.image = image
    }
    @objc func updatepic(_ timer: Timer){
    if self.index == 2 {
    self.index = 0
    } else {
    self.index+=1
    }
    imageView.image = images[index]
    }
    @IBAction func Next(_ sender: Any) {
        if self.index == 2 {
            self.index = 0
        } else {
        self.index+=1
        }
        imageView.image = images[index]
    }
    
    @IBAction func Return(_ sender: Any) {
        if self.index == 0 {
            self.index = 2
        } else {
            self.index-=1
        }
        imageView.image = images[index]
    }
    @IBAction func play_and_stop(_ sender: Any) {
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updatepic(_:)), userInfo: nil, repeats: true)
        } else {
            self.timer.invalidate()
            self.timer = nil
        }
        
    }
  
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue ) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ResultviewController:ResultViewController = segue.destination as! ResultViewController
         ResultviewController.image2 = self.images[self.index]
    }
}

