//
//  startViewController.swift
//  LoveYou
//
//  Created by ashika shanthi on 3/29/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit
import Lottie

class startViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let gift = LOTAnimationView(name: "newAnimation")
        gift.contentMode = .scaleAspectFill
        gift.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        gift.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        gift.center = self.view.center
        gift.play()
        gift.loopAnimation = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(playAnimation))
        gift.addGestureRecognizer(tapGesture)
        view.addSubview(gift)
    }
    @objc func playAnimation(){
        performSegue(withIdentifier: "start", sender: self)
    }
}
