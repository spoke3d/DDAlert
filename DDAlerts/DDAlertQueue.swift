//
//  DDAlertQueue.swift
//  DDAlerts
//
//  Created by Dmitry Danilov on 29.02.16.
//  Copyright © 2016 Danilov Dmitriy. All rights reserved.
//

import UIKit

class DDAlertQueue: NSObject {
    
    //MARK: Variables
    static private var sharedObject: DDAlertQueue?
    
    var alertsQueue : NSOperationQueue
    
    static func sharedAlertQueue() -> DDAlertQueue? {
        //Synchronize for check shared object and create if it not exist
        objc_sync_enter(self);
        if ((DDAlertQueue.sharedObject == nil)) {
            //Creating shared Object if it not exist
            DDAlertQueue.sharedObject = DDAlertQueue();
            }
        objc_sync_exit(self);
        return DDAlertQueue.sharedObject;
    }
    
    override init() {
        alertsQueue = NSOperationQueue();
    }
    
    
    func addAlert(alertController: UIAlertController, parentController : UIViewController? = nil) {
        let parentViewController = parentController ?? UIApplication.sharedApplication().keyWindow?.rootViewController
        
        var alertBlockOperation = NSBlockOperation { () -> Void in
            parentViewController?.presentViewController(alertController, animated: true, completion: { () -> Void in
                
            });
        }
        alertBlockOperation.qualityOfService = .UserInteractive;
        if let lastAlertOperation = alertsQueue.operations.last {
            alertBlockOperation.addDependency(lastAlertOperation);
        }
        alertsQueue .addOperation(alertBlockOperation);
    }

}
