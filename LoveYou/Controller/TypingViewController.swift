//
//  TypingViewController.swift
//  LoveYou
//
//  Created by ashika shanthi on 3/19/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit
import Lottie

class TypingViewController: UIViewController {
    var textDisplay: AnimatedTextField!
    var tD2: AnimatedTextField!
    var gift: LOTAnimationView!
    var nextVC = ViewController()
    let transition = PopAnimator()
  
    @IBOutlet weak var giftButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        textDisplay = AnimatedTextField(frame: view.bounds)
        textDisplay.setText(text: "Happy")
        view.addSubview(textDisplay!)
        
        tD2 = AnimatedTextField(frame: view.bounds)
        tD2.setText(text: "Birthday")
        view.addSubview(tD2!)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textDisplay.frame = CGRect(x: 100,
                                   y: view.bounds.size.height/4,
                                   width: view.bounds.size.width,
                                   height: 120)
        tD2.frame = CGRect(x: 50,
                           y: textDisplay.frame.maxY,
                           width: view.bounds.size.width,
                           height: 70)
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
       nextVC.transitioningDelegate = self
        performSegue(withIdentifier: "one", sender: self)
    }
}
extension TypingViewController: UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        transition.originFrame = giftButton.frame
        transition.finalFrame = nextVC.gift.frame
        textDisplay.isHidden = true
        tD2.isHidden = true
        giftButton.isHidden = true
        return transition
    }
}

