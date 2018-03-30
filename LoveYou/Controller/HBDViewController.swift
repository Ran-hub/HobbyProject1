//
//  HBDViewController.swift
//  LoveYou
//
//  Created by ashika shanthi on 3/29/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit
import Lottie

class HBDViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(segue))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tapGesture)
    }
    
    @objc func segue(){
      performSegue(withIdentifier: "Final", sender: self)
    }
    
}
