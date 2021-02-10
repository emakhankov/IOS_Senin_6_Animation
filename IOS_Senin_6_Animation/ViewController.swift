//
//  ViewController.swift
//  IOS_Senin_6_Animation
//
//  Created by Jenya on 10.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func pushButton1Action1(_ sender: Any) {
    
        
        UIView.animate(withDuration: 1) {
            //self.button1.alpha = 0
            // self.button1.center = self.view.center
            var frame = self.button1.frame
            frame.origin.x = 0
            frame.origin.y = 0
            self.button1.frame = frame
        }
    }
    
    
    @IBAction func pushButton2Action(_ sender: Any) {
        
        let parentFrame = self.button2.frame
        let center = button2.center
        
        UIView.animate(withDuration: 0.2) {
           // self.button2.alpha = 0
            var frame = self.button2.frame
            frame.size.width = frame.size.width - 20
            frame.size.height = frame.size.height - 20
            
            self.button2.frame = frame
            self.button2.center = center
            
        } completion: { (bool) in
            //self.button2.alpha = 1
            self.button2.frame = parentFrame
        }

    }
    
    @IBAction func pushButton3Action(_ sender: Any) {
        
        let center = button3.center
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 100, options: .allowAnimatedContent) {
            
            var c = self.button3.center
            c.y = c.y + 100
            self.button3.center = c
            
           
        } completion: { (bool) in
            //self.button3.center = center
        }

        
    }
    
    
}

