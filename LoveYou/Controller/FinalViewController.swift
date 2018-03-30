//
//  FinalViewController.swift
//  LoveYou
//
//  Created by ashika shanthi on 3/29/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit
import Lottie

class FinalViewController: UIViewController {

    @IBOutlet weak var labl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playAnimation()
        
        labl.text = "Lets Celebrate! \n Cheers!"
        labl.textColor = UIColor.red
        labl.numberOfLines = 5
        self.view.bringSubview(toFront: labl)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(final))
        labl.addGestureRecognizer(tapGesture)
        
    }
    func playAnimation(){
        view.backgroundColor = UIColor.white
        let b = LOTAnimationView(name: "balloons_with_string")
        b.backgroundColor = UIColor.white
        b.contentMode = .scaleAspectFill
        b.frame = self.view.frame
        b.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        b.center = self.view.center
        b.play()
        b.loopAnimation = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(final))
        b.addGestureRecognizer(tapGesture)
        view.addSubview(b)
    }
    
    @objc func final() {
        view.backgroundColor = UIColor.white
        
        let c = LOTAnimationView(name: "confetti")
        c.contentMode = .scaleAspectFill
        c.frame = self.view.frame
        c.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        c.center = self.view.center
        c.play()
        c.loopAnimation = true
        
        view.addSubview(c)
        
        
    }
}
