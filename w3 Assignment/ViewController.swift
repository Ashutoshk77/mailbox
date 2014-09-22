//
//  ViewController.swift
//  w3 Assignment
//
//  Created by Ashutosh Kumar on 9/16/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var reschedule: UIImageView!
    @IBOutlet weak var later: UIImageView!
                            
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var list: UIImageView!
    @IBOutlet weak var tick: UIImageView!
    @IBOutlet weak var cross: UIImageView!
    @IBOutlet var message: UIImageView!
    
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet var tray: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scroller.contentSize = CGSize(width: 320, height: 1000)
        
    }
        
    @IBAction func onMessage(panRecognizer: UIPanGestureRecognizer) {
        
        
        var location = panRecognizer.locationInView(view)
        var velocity = panRecognizer.velocityInView(view)

        
        
        if panRecognizer.state == UIGestureRecognizerState.Began {
            println("Gesture began at: \(location)")
            
        }
      
        else if panRecognizer.state == UIGestureRecognizerState.Changed {
            println("Gesture changed at: \(location)")
            
            if location.x <= 260 {
                self.message.center.x = location.x
                self.tick.center.x = location.x - 180
                self.cross.center.x = location.x - 180
                tray.backgroundColor = UIColor.greenColor()
                tick.alpha = 1
                cross.alpha = 0
            }
            
            if location.x >= 260 {
                self.message.center.x = location.x
                self.tick.center.x = location.x - 180
                self.cross.center.x = location.x - 180
                tray.backgroundColor = UIColor.redColor()
                tick.alpha = 0
                cross.alpha = 1
            }
          
            
            if location.x <= 160 {
                self.message.center.x = location.x
                tray.backgroundColor = UIColor.yellowColor()
                self.later.center.x = location.x + 180
                self.list.center.x = location.x + 180
                later.alpha = 1
                list.alpha = 0
            }
                
                
            if location.x <= 60 {
                self.message.center.x = location.x
                tray.backgroundColor = UIColor.orangeColor()
                self.later.center.x = location.x + 180
                self.list.center.x = location.x + 180
                later.alpha = 0
                list.alpha = 1
            }
                
                
                
            else {
                //Viewtray.frame.origin.y=location.y
                
            }
            
            
        }
            
           
            
        else if panRecognizer.state == UIGestureRecognizerState.Ended {
            println("Gesture ended at: \(location)")
            
           // -- code for velocity
          
            let velocity = panRecognizer.velocityInView(self.view)
            let magnitude = sqrt((velocity.x * velocity.x))
            let slideMultiplier = magnitude / 30
            println("magnitude: \(magnitude), slideMultiplier: \(slideMultiplier)")
            
            // 2
            let slideFactor = 0.1 * slideMultiplier     //Increase for more of a slide
            // 3
            var finalPoint = CGPoint(x:panRecognizer.view!.center.x + (velocity.x * slideFactor),
                y:panRecognizer.view!.center.y + (velocity.y * 0))
            // 4
            finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
            
            // 5
            UIView.animateWithDuration(Double(slideFactor * 2),
                delay: 0,
                // 6
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: {panRecognizer.view!.center = finalPoint },
                completion: nil)
         
            // -- code for velocity
         

            if location.x <= 5 {
                
                reschedule.alpha = 1
                tray.alpha = 0

            }
           
            
            
            
            
            
            
        }

        
        
        
    }

    @IBAction func onTap(tap: UITapGestureRecognizer) {
        
        reschedule.alpha = 0
        scroller.contentOffset.y = 86
    
    }
    
   
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
          
    }


}

