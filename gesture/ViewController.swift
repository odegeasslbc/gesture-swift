//
//  ViewController.swift
//  gesture
//
//  Created by 刘炳辰 on 14/12/5.
//  Copyright (c) 2014年 刘炳辰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tapView: UIView!
    @IBOutlet var swipeView: UIView!
    @IBOutlet var longPressView: UIView!
    @IBOutlet var pinchView: UIView!
    @IBOutlet var rotateView: UIView!
    @IBOutlet var panView: UIView!
    
    var rotation = CGFloat()
    let tapRec = UITapGestureRecognizer()
    let tapRec2 = UITapGestureRecognizer()

    let pinchRec = UIPinchGestureRecognizer()
    let swipeLeftRec = UISwipeGestureRecognizer()
    let swipeRightRec = UISwipeGestureRecognizer()

    let longPressRec = UILongPressGestureRecognizer()
    let rotateRec = UIRotationGestureRecognizer()
    let panRec = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        swipeLeftRec.direction = UISwipeGestureRecognizerDirection.Left
        swipeRightRec.direction = UISwipeGestureRecognizerDirection.Right

        super.viewDidLoad()
        
        tapRec.addTarget(self, action: "tappedView")
        tapRec2.addTarget(self, action: "tappedView")
        
        pinchRec.addTarget(self, action: "pinchedView:")
        
        swipeLeftRec.addTarget(self, action: "swipedLeftView")
        swipeRightRec.addTarget(self, action: "swipedRightView")
        
        longPressRec.addTarget(self, action: "longPressedView")
        
        rotateRec.addTarget(self, action: "rotatedView:")
        
        panRec.addTarget(self, action: "draggedView:")
        
        tapView.addGestureRecognizer(tapRec)
        swipeView.addGestureRecognizer(swipeLeftRec)
        swipeView.addGestureRecognizer(swipeRightRec)
        pinchView.addGestureRecognizer(pinchRec)
        longPressView.addGestureRecognizer(longPressRec)
        rotateView.addGestureRecognizer(rotateRec)
        
        panView.addGestureRecognizer(panRec)
        panView.addGestureRecognizer(tapRec2)

        rotateView.userInteractionEnabled = true
        rotateView.multipleTouchEnabled = true
        pinchView.userInteractionEnabled = true
        pinchView.multipleTouchEnabled = true
        tapView.userInteractionEnabled = true;
        swipeView.userInteractionEnabled  = true
        longPressView.userInteractionEnabled = true
        panView.userInteractionEnabled = true
        // Do any additional setup after loading th3e view, typically from a nib.
    }
    
    func tappedView(){
        let tapAlert = UIAlertController(title: "Tapped", message: "You just tapped the tap view", preferredStyle: UIAlertControllerStyle.Alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
        self.presentViewController(tapAlert, animated: true, completion: nil)
    }
    
    func swipedLeftView(){
        let tapAlert = UIAlertController(title: "Swiped", message: "You just swiped left the swipe view", preferredStyle: UIAlertControllerStyle.Alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
        self.presentViewController(tapAlert, animated: true, completion: nil)
    }
    
    func swipedRightView(){
        let tapAlert = UIAlertController(title: "Swiped", message: "You just swiped right the swipe view", preferredStyle: UIAlertControllerStyle.Alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
        self.presentViewController(tapAlert, animated: true, completion: nil)
    }
    
    func longPressedView(){
        
        let tapAlert = UIAlertController(title: "Long Pressed", message: "You just long pressed the long press view", preferredStyle: UIAlertControllerStyle.Alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
        self.presentViewController(tapAlert, animated: true, completion: nil)

    }
    
    func rotatedView(sender:UIRotationGestureRecognizer){
        var lastRotation = CGFloat()
        self.view.bringSubviewToFront(rotateView)
        if(sender.state == UIGestureRecognizerState.Ended){
            lastRotation = 0.0;
        }
        rotation = 0.0 - (lastRotation - sender.rotation)
        var point = rotateRec.locationInView(rotateView)
        var currentTrans = sender.view?.transform
        var newTrans = CGAffineTransformRotate(currentTrans!, rotation)
        
        sender.view?.transform = newTrans
        lastRotation = sender.rotation
        
    }
    
    
    func pinchedView(sender:UIPinchGestureRecognizer){
        self.view.bringSubviewToFront(pinchView)
        var currentTrans = sender.view?.transform
        var newTrans = CGAffineTransformScale(currentTrans!, sender.scale, sender.scale)
        
        sender.view?.transform = newTrans
        sender.scale = 1.0
    }
    
    func draggedView(sender:UIGestureRecognizer){
        if sender == panRec {
            self.view.bringSubviewToFront(sender.view!)
            var translation = panRec.translationInView(self.view)
            sender.view?.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
            panRec.setTranslation(CGPointZero, inView: self.view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

