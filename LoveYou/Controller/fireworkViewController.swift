//
//  fireworkViewController.swift
//  LoveYou
//
//  Created by ashika shanthi on 3/20/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit
import Lottie

class fireworkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        let firework = LOTAnimationView(name: "firework")
        firework.frame = view.bounds
        firework.center = self.view.center
        firework.contentMode = .scaleAspectFill
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(segue))
        firework.addGestureRecognizer(tapGesture)
        
        view.addSubview(firework)
        
        firework.play()
        firework.loopAnimation = true
        
        
        let label = UILabel()
        label.frame = CGRect(x: 0, y: view.frame.width/2 , width: self.view.frame.width-12, height: 50)
        label.center = view.center
        label.textAlignment = .center
        label.textColor = UIColor(red: 245/255, green: 176/255, blue: 65/255, alpha: 1)
        label.text = "I LOVE YOU"
        label.font = label.font.withSize(36)
        
        
       
        view.addSubview(label)
    }
    @objc func segue(){
        performSegue(withIdentifier: "IMG", sender: self)
    }
}
