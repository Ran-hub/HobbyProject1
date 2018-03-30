//
//  AnimatedTextView.swift
//  LoveYou
//
//  Created by ashika shanthi on 3/19/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.

import UIKit
import Lottie

class AnimatedTextField: UIView {
    
    fileprivate var collectionView:UICollectionView?
    
    fileprivate var layout = UICollectionViewFlowLayout()
    fileprivate var updatingCells = true
    fileprivate var letterSizes = [CGSize]()
    
    var text:String = ""
    
    private var fontSize:Int = 56
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView?.register(LACharacterCell.self, forCellWithReuseIdentifier: "char")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.white
        addSubview(collectionView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView!.frame = bounds
    }
    
    fileprivate func characterAtIndexPath(indexPath:IndexPath) -> String{
        let nsText = text as NSString
        return nsText.substring(with: NSMakeRange(indexPath.row, 1)).uppercased() as String
    }
    
    fileprivate func computeLetterSizes() {
        var sizes = [CGSize]()
        let width = bounds.size.width
        var currentWidth:CGFloat = 0
        
        for i in 0..<text.characters.count {
            let nsString = text as NSString
            let letter = nsString.substring(with: NSMakeRange(i, 1)).uppercased() as String
            
            var letterSize = sizeOfString(string: letter)
            
            if letter == " " && i + 1 < text.characters.count {
                let cutString = nsString.substring(from: i + 1)
                let words = cutString.components(separatedBy: " ")
                
                if words.count > 0 {
                    let nextWordLength = sizeOfString(string: words.first!)
                    if currentWidth + nextWordLength.width + letterSize.width > width {
                        letterSize.width = floor(width - currentWidth)
                        currentWidth = 0
                    } else {
                        currentWidth += letterSize.width
                    }
                }
                
            } else {
                // cursor size
                currentWidth += letterSize.width
                if currentWidth >= width {
                    currentWidth = letterSize.width
                }
            }
            sizes.append(letterSize)
            
        }
        
        let cursorSize = sizeOfString(string: "w")
        sizes.append(cursorSize)
        letterSizes = sizes
    }
    
    fileprivate func sizeOfString(string:String) -> CGSize {
        let constraint = CGSize(width: 30, height: 50)
        var nsText = text as NSString
        nsText = nsText.uppercased as NSString
        
        var textSize = nsText.boundingRect(with: constraint,
                                           options: .usesLineFragmentOrigin,
                                           attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: CGFloat(fontSize))],
                                           context: nil).size
        
        textSize.width += CGFloat(string.characters.count * 2)
        return textSize
        
    }
    
    func setText(text:String) {
        self.text = text
        computeLetterSizes()
        collectionView?.reloadData()
    }
    
}

// MARK: UICollectionViewDataSource
extension AnimatedTextField: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // +1是為了把光標(Cursor)加進去
        return text.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let charCell = collectionView.dequeueReusableCell(withReuseIdentifier: "char", for: indexPath) as! LACharacterCell
        return charCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let aCell = cell as! LACharacterCell
        if indexPath.row < text.count {
            aCell.setCharacter(character: characterAtIndexPath(indexPath: indexPath))
            aCell.displayCharacter(animated: updatingCells)
            aCell.loopAnimation()
        }
    }
}


// MARK: UICollectionViewFlowLayout
extension AnimatedTextField: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("collectionCell size \(letterSizes[indexPath.row])")
        return letterSizes[indexPath.row]
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}





