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
    
    @IBOutlet weak var Next: UIButton!
    
    @IBOutlet weak var Return: UIButton!
    
    @IBOutlet weak var play_and_stop: UIButton!
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
    
    
    @IBAction func Next(_ sender: UIButton) {
        if self.index == 2 {
            self.index = 0
        } else {
            self.index+=1
        }
        imageView.image = images[index]
    }
    
    
    @IBAction func Return(_ sender: UIButton) {
        if self.index == 0 {
            self.index = 2
        } else {
            self.index-=1
        }
        imageView.image = images[index]
    }
    
    
    @IBAction func play_and_stop(_ sender: UIButton) {
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updatepic(_:)), userInfo: nil, repeats: true)
            sender.setTitle("停止", for: .normal)
            Next.isEnabled = false
            Return.isEnabled = false
        } else {
            self.timer.invalidate()
            self.timer = nil
            sender.setTitle("再生", for: .normal)
            Next.isEnabled = true
            Return.isEnabled = true
        }
        
    }
    
    
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue ) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ResultviewController:ResultViewController = segue.destination as! ResultViewController
        ResultviewController.image2 = self.images[self.index]
        if self.timer != nil{
            self.timer.invalidate()
            self.timer = nil
            self.play_and_stop.setTitle("再生", for: .normal)
        }
        
        Next.isEnabled = true
        Return.isEnabled = true
    }
    
}

