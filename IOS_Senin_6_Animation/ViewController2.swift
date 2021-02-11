//
//  ViewController2.swift
//  IOS_Senin_6_Animation
//
//  Created by Jenya on 11.02.2021.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func button1Action(_ sender: Any) {
        
        UIView.animate(withDuration: 1) {
            self.button1.transform = CGAffineTransform(scaleX: 2, y: 2)
        } completion: { (bool) in
            self.button1.transform = .identity
        }

        
    }
    @IBAction func button2Action(_ sender: Any) {
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: UIView.AnimationOptions.allowAnimatedContent) {
        //UIView.animate(withDuration: 1) {
            self.button2.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        } completion: { (bool) in
            self.button2.transform = .identity
        }
        
    }
    
    
    @IBAction func button3Action(_ sender: Any) {
        
        UIView.animate(withDuration: 1) {
            self.button3.transform = CGAffineTransform(translationX: 100, y: 100).scaledBy(x: 1.5, y: 0.7)
        } completion: { (bool) in
            self.button3.transform = .identity
        }
    }
}
