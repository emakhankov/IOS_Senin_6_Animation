//
//  FirstViewController.swift
//  IOS_Senin_6_Animation
//
//  Created by Jenya on 12.02.2021.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
            
        UIView.animate(withDuration: 1.5, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: UIView.AnimationOptions.allowAnimatedContent) {
            self.imageView.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
            
        } completion: { (Bool) in
            
            let tbc = self.storyboard!.instantiateViewController(identifier: "mainSID")
            tbc.modalPresentationStyle = .fullScreen
            self.present(tbc, animated: false, completion: nil)
        }

        
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
