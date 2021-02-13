//
//  ViewController3.swift
//  IOS_Senin_6_Animation
//
//  Created by Jenya on 13.02.2021.
//

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet weak var viewForTab: UIView!
    @IBOutlet weak var viewForSwipe: UIView!
    
    @IBOutlet weak var labelPan: UILabel!
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let tab = UITapGestureRecognizer(target: self, action: #selector(self.tap))
        tab.numberOfTapsRequired = 2 // Кол-во кликов
        tab.numberOfTouchesRequired = 1 //  Кол-во пальцев
        viewForTab.gestureRecognizers = [tab]
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeLeft))
        swipeLeft.direction = .left
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeRight))
        swipeRight.direction = .right
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeUp))
        swipeUp.direction = .up
        
        let swipeDown =  UISwipeGestureRecognizer(target: self, action: #selector(self.swipeDown))
        swipeDown.direction = .down
        
        viewForSwipe.gestureRecognizers = [swipeLeft, swipeRight, swipeUp, swipeDown]
        
        
        
        
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.pan))
        labelPan.gestureRecognizers = [pan]
    }
    
    @objc func tap() {
        
        UIView.animate(withDuration: 1) {
            self.viewForTab.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.viewForTab.backgroundColor = .cyan
        }
        
        //print("tap")
    }
    
    func animateSwipe(dx: CGFloat, dy: CGFloat) {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: UIView.AnimationOptions.allowAnimatedContent) {
            self.viewForSwipe.transform = CGAffineTransform(translationX: dx, y: dy)
        } completion: { (Bool) in
            UIView.animate(withDuration: 1) {
                self.viewForSwipe.transform = .identity
            }
            
        }
    }
    
    @objc func swipeLeft() {
        animateSwipe(dx: -100, dy: 0)
    }
    
    @objc func swipeRight() {
        animateSwipe(dx: 100, dy: 0)
    }
    
    @objc func swipeUp() {
        animateSwipe(dx: 0, dy: -100)
    }
    
    @objc func swipeDown() {
        animateSwipe(dx: 0, dy: 100)
    }
    
    
    var center: CGPoint = CGPoint(x: 0, y: 0)
    @objc func pan(panGestureRecognozer: UIPanGestureRecognizer)
    {
        
        if panGestureRecognozer.state == .began {
            center = labelPan.center
        }
        
        let coord = panGestureRecognozer.translation(in: self.view)
        let x = Int(coord.x)
        let y = Int(coord.y)
        
        let newCenter = CGPoint(x: center.x + coord.x, y: center.y)
        labelPan.text = "x=\(x), y=\(y)"
        
        labelPan.center = newCenter
        //labelPan.transform = CGAffineTransform(translationX: coord.x, y: coord.y)
        
        
        if panGestureRecognozer.state == .ended {
            var text = "Touch me"
            if (x < -80) {
                text = "Мля на уя так далеко"
                
            }
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .allowAnimatedContent) {
                self.labelPan.center = self.center
            } completion: { (Bool) in
                self.labelPan.text = text
            }
            
            
            
        }
    }
    
    
    
    
    @IBAction func pinchAction(_ sender: UIPinchGestureRecognizer) {
        
        if sender.state == .ended {
            UIView.animate(withDuration: 1) {
                self.imageView.transform = CGAffineTransform.identity
            }
        }
        imageView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
