//
//  heartViewController.swift
//  LoveYou
//


import UIKit
import Lottie

class heartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = LOTAnimationView(name: "exploding_heart")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        
        animationView.play()
        animationView.loopAnimation = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(display))
        animationView.addGestureRecognizer(tapGesture)
        
        view.addSubview(animationView)
    }
    
    @objc func display(){
       performSegue(withIdentifier: "HBD", sender: self)
       
    }
}
