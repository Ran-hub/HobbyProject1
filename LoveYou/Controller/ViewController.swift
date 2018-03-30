//
//  ViewController.swift
//  LoveYou
//
//  Created by ashika shanthi on 3/16/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    var gift: LOTAnimationView!
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        gift = LOTAnimationView(name: "happy_gift")
        gift.contentMode = .scaleAspectFill
        gift.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        gift.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        gift.center = self.view.center
        gift.play()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(playAnimation))
        gift.addGestureRecognizer(tapGesture)
        view.addSubview(gift)
        
    }
  
    @objc func playAnimation(){
        if count < 5{
            gift.animationProgress = 0
            gift.frame = CGRect(x: 0, y: 0, width: self.gift.frame.width * 2, height: self.gift.frame.height * 2)
            gift.center = self.view.center
            gift.play()
            count += 1
        }
        else {
            performSegue(withIdentifier: "firework", sender: self)
        }
    }
    
}

