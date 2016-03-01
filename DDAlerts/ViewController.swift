//
//  ViewController.swift
//  DDAlerts
//
//  Created by Dmitry Danilov on 28.02.16.
//  Copyright © 2016 Danilov Dmitriy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var testView: UIView!;
    var testView2: UIView!;
    
//    init() {
//        
//    }

//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testView = UIView.init(frame: CGRectMake(0, 100, 50, 50));
        testView.backgroundColor = UIColor.redColor()
//        testView.translatesAutoresizingMaskIntoConstraints = false;
        self.view.addSubview(testView);
        
//        testView2 = UIView.init(frame: CGRectMake(0, 100, 50, 50));
//        testView2.backgroundColor = UIColor.blueColor();
//        view.addSubview(testView2)
//        
//        NSLayoutConstraint (item: testView,
//            attribute: .CenterX,
//            relatedBy: .Equal,
//            toItem: testView2,
//            attribute: .LeadingMargin,
//            multiplier: 1.0,
//            constant: 0.0).active = true;
//        
//        
//        let margins = testView.layoutMarginsGuide;
//        testView2.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor).active = true;
        
        let views = Dictionary(dictionaryLiteral: ("testView",testView));
        var constraints = [NSLayoutConstraint]();
//        constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-[testView(200)]-|",
//            options: [],
//            metrics: nil,
//            views: views);
//        
//        constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|-[testView(==200)]-|",
//            options: [],
//            metrics: nil,
//            views: views);
        
//        constraints.append(NSLayoutConstraint(item: testView,
//            attribute: .CenterX,
//            relatedBy: .Equal,
//            toItem: self.view,
//            attribute: .CenterX,
//            multiplier: 1,
//            constant: 0));
//        
//        constraints.append(NSLayoutConstraint(item: testView,
//            attribute: .CenterY,
//            relatedBy: .Equal,
//            toItem: self.view,
//            attribute: .CenterY,
//            multiplier: 1,
//            constant: 0));
//        
//        self.view.addConstraints(constraints);
        
//        testView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
//        testView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        
//        NSLayoutConstraint.activateConstraints(constraints);
        
        var alerQueue : DDAlertQueue? = DDAlertQueue.sharedAlertQueue();
        
        let alert1 : UIAlertController = UIAlertController.init(title: "test1", message: nil, preferredStyle: .Alert)
        alert1.addAction(UIAlertAction.init(title: "OK", style: .Default, handler: { (_) -> Void in
            print("Test 1 complited")
        }))
        let scheet1 : UIAlertController = UIAlertController.init(title: "test2", message: nil, preferredStyle: .Alert)
        
        alerQueue?.addAlert(alert1, parentController: self)
        alerQueue?.addAlert(scheet1, parentController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

