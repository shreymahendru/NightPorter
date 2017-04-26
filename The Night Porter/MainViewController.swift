//
//  MainViewController.swift
//  The Night Porter
//
//  Created by Shrey Mahendru on 2017-04-25.
//  Copyright © 2017 Shrey Mahendru. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var AppnameAnimate = true
    
    @IBOutlet weak var appName: UILabel!
    
    var timer : Timer!
    var frame = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
//        UserDefaults.standard.set("Shrey", forKey: "name")
        let name = UserDefaults.standard.value(forKey: "name")
        if (name != nil) {
            print(name!)
        }else{
            print ("naaa ")
        }
        
        //animation stuff here
        
//        timer = Timer.scheduledTimer(withTimeInterval: -.5, repeats: true, selector: #selctor("animateImage"), u )
        
        
        
    }
    
    
    func animateImage(){
        frame += 1
        if frame > 10{
            print("printitng image")
            frame = 1
        }
        let imageName = "frame\(frame).png"
        imageView.image = UIImage(named: imageName)
    }
    
    
    //all the subviews has been laid out
    override func viewDidLayoutSubviews() {
        print("did layout ")
        // move the app name put of the view
        
        appName.center = CGPoint(x: appName.center.x - 400, y: appName.center.y)
        
        
    }

    //notify when the view is actually added to the View
    override func viewDidAppear(_ animated: Bool) {
        
         timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animateImage), userInfo: nil, repeats: true)
        print("did appear ")
        if  AppnameAnimate == true{
        
            UIView.animate(withDuration: 1) {
                self.appName.center = CGPoint(x: self.appName.center.x + 400, y: self.appName.center.y)
                self.AppnameAnimate = false
            }
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
        print("Killed timer")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
