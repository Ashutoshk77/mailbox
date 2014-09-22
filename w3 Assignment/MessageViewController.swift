//
//  MessageViewController.swift
//  w3 Assignment
//
//  Created by Ashutosh Kumar on 9/16/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {


    @IBOutlet weak var Message: UIImageView!
    
    @IBOutlet var Dragger: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
        
        Message.addGestureRecognizer(panGestureRecognizer)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

    func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
        var point = panGestureRecognizer.locationInView(view)
        var velocity = panGestureRecognizer.velocityInView(view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            println("Gesture began at: \(point)")
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            println("Gesture changed at: \(point)")
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            println("Gesture ended at: \(point)")
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
