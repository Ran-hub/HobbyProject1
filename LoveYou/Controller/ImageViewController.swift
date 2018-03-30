//
//  ImageViewController.swift
//  LoveYou
//
//  Created by ashika shanthi on 3/29/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    var img: UIImageView!
    
    var count = 1
    let type = ["pageCurl","cube", "rotate", "flip", "suckEffect"]
    let subType = [kCATransitionFromBottom,kCATransitionFromTop, kCATransitionFromLeft, kCATransitionFromRight]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        img = UIImageView(frame: self.view.bounds)
        img.layer.cornerRadius = 15
        img.center = view.center
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "\(count)")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(loadImage))
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(tapGesture)
        
        view.addSubview(img)
        
    }

    @objc func loadImage(){
        if count == 5 {
            performSegue(withIdentifier: "performHeart", sender: self)
        }
        let transition = CATransition()
        transition.type = type[count-1]
        transition.subtype = subType[Int(arc4random_uniform(UInt32(subType.count)))]
        transition.duration = 1
        img.layer.add(transition, forKey: "transition")
        
        count += 1
        img.image = UIImage(named: "\(count)")
        view.layer.addSublayer(img.layer)
    }
}
