//
//  ViewController.swift
//  notification
//
//  Created by iGuest on 5/31/16.
//  Copyright © 2016 iSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var Time = 15
    var timer = NSTimer()
    var localNotification:UILocalNotification = UILocalNotification()

    @IBOutlet weak var mySwitch: UISwitch!
    
    
    @IBAction func PushNotification(sender: AnyObject) {
        var AlertView = UIAlertController(title: "Wake Up", message:"Press to Stop", preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(AlertView, animated:true, completion: nil)
        AlertView.addAction(UIAlertAction(title: "Go", style: UIAlertActionStyle.Default,handler: nil ))
    }
    
    
    func toggleSwitch(){
        if mySwitch.on{
            Notification()
        }
    }
    
    func Notification(){
        var notification = UILocalNotification()
        Time -= 1
        
        if(Time == 0) {
        
            //alertAction is what you what to do go back to the app or cancel
        notification.alertAction = "go the tasks"
        notification.alertBody = "Complete the task!"
        
        //when fire
        notification.fireDate = NSDate(timeIntervalSinceNow: 0)
        
        //evething add to the notification above this
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
            
        timer.invalidate()
        
        }
        
        
    }
        
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.toggleSwitch), userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

