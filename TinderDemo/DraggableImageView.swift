//
//  DraggableImageView.swift
//  TinderDemo
//
//  Created by Audrey Chaing on 11/10/16.
//  Copyright © 2016 Audrey Chaing. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {
    
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var point = CGPoint()
    var image : UIImage? {
        didSet{
            imageView.image = image
        }
    }
    
    
    @IBAction func onPanGesture(_ panGestureRecognizer: UIPanGestureRecognizer) {
        
        let imageView = panGestureRecognizer.view as! UIImageView
        let dragLocation = panGestureRecognizer.location(in: self.superview)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.began {
            print("Gesture began at: \(point)")
            // Gesture recognizers know the view they are attached to
            self.point = imageView.center
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.changed {
            print("Gesture changed at: \(point)")
            
            imageView.center = CGPoint(x: dragLocation.x, y: point.y)
            
            if dragLocation.x < point.x {
                //left
                let leftDiff = point.x - dragLocation.x
                imageView.transform = CGAffineTransform(rotationAngle: (leftDiff * -0.01))
            } else {
                //right
                let rightDiff = dragLocation.x - point.x
                imageView.transform = CGAffineTransform(rotationAngle: (rightDiff * 0.01))

            }
        } else if panGestureRecognizer.state == UIGestureRecognizerState.ended {
            let translation = dragLocation.x - point.x
            if translation > 50 {
                //animate right
                UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.25, options: .curveEaseOut, animations: {
                    imageView.center = CGPoint(x: imageView.frame.width * 2 + (self.contentView.superview?.frame.width)!, y: self.point.y)
                })
            } else {
                //animate left
                UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.25, options: .curveEaseOut, animations: {
                    imageView.center = CGPoint(x: imageView.frame.width * -2, y: self.point.y)
                })
                
            }
        }

        
    }

}


extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
    var radiansToDegrees: Double { return Double(self) * 180 / .pi }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
