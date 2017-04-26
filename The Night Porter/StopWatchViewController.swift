//
//  StopWatchViewController.swift
//  The Night Porter
//
//  Created by Shrey Mahendru on 2017-04-25.
//  Copyright © 2017 Shrey Mahendru. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {

    @IBOutlet weak var timeDisplay: UILabel!
    
    var timer : Timer!
    var time = 0
    var start = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Stopwatch"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func play(_ sender: UIBarButtonItem) {
        
        if !start{
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(increaseTimer), userInfo: nil, repeats: true)
            start = true
        }
        
    }
    
    
    @IBAction func stop(_ sender: UIBarButtonItem) {
        if start {
            timer.invalidate()
            start = false
        }
        
    }
    
    
    @IBAction func reset(_ sender: UIBarButtonItem) {
        

            time = 0
            timeDisplay.text = "00:00"
            timer.invalidate()
            start = false
    
        
        
    }
    
    
    
    func increaseTimer() {
        time += 1
        let sec = time%60
        let min = (time/60) % 60
        timeDisplay.text = String(min) + ":" + String(sec)
    }
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
